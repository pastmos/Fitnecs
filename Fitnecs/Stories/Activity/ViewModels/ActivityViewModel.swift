//
//  ActivityViewModel.swift
//  Fitnecs
//
//  Created by Panov Sergey on 27.09.2020.
//

import UIKit
import GoogleMaps
import HealthKit
import Charts

protocol ActivityViewModelCoordinatorDelegate: AnyObject {
    func openProfile(controller: UIViewController)
    func close(from controller: UIViewController)
}

protocol ActivityViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: ActivityViewModelCoordinatorDelegate? { get set }


    // MARK: Data Sources


    // MARK: Callbacks

    var updateState: ((ActivityState) -> Void)? { get set }
    var updateUser: ((UserViewData) -> Void)? { get set }
    var updateActivity: ((ActivityViewData) -> Void)? { get set }
    var updateChart: ((ChartViewData, ChartType) -> Void)? { get set }

    // MARK: Events

    func start()
    func getActivityViewData()
    func activityItemDidTap(_ type: ChartType)
    func profileDidTap(controller: UIViewController)
    func back(from controller: UIViewController)

}

enum ActivityState {
    case normal
    case loading
    case error(viewData: ErrorViewDataType)
}


class ActivityViewModel: ActivityViewModelProtocol {

    // MARK: Delegates
    weak var coordinatorDelegate: ActivityViewModelCoordinatorDelegate?

    // MARK: Variables
    private var healthService: HealthKitServiceProtocol?
    private var uploadService: UploadAPIService?
    private var activityService: ActivityAPIService?

    // MARK: Callbacks

    var updateState: ((ActivityState) -> Void)?
    var updateUser: ((UserViewData) -> Void)?
    var updateActivity: ((ActivityViewData) -> Void)?
    var updateChart: ((ChartViewData, ChartType) -> Void)?

    let locationManager = CLLocationManager()

    var data: ActivityData = ActivityData()

    var userData: UserViewData = UserViewData()

    var activitiesData: ActivityViewData = ActivityViewData(
        kilometersItemData: ActivityItemViewData(image: Assets.Images.distanceIcon.image, amount: "", unit: "", isActive: false, type: .distance), stepsItemData: ActivityItemViewData(image: Assets.Images.stepsIcon.image, amount: "", unit: "", isActive: false, type: .steps),
        caloriesItemData: ActivityItemViewData(image: Assets.Images.caloriesIcon.image, amount: "", unit: "", isActive: false, type: .calories)) {
        didSet {
            self.updateActivity?(self.activitiesData)
        }
    }

    var chartData: ChartViewData = ChartViewData()

    var steps: String = "" {
        didSet {
            self.activitiesData.stepsItemData.amount = steps
        }
    }
    var kilometers: String = "" {
        didSet {
            self.activitiesData.kilometersItemData.amount = kilometers
        }
    }
    var calories: String = "" {
        didSet {
            self.activitiesData.caloriesItemData.amount = calories
        }
    }

    var selectedActivitytype: ChartType = .steps

    var state: ActivityState = .normal

    init(healthService: HealthKitServiceProtocol = HealthKitService(), uploadService: UploadAPIService = UploadAPIServiceImplementation(), activityService: ActivityAPIService = ActivityAPIServiceImplementation()) {
        self.healthService = healthService
        self.uploadService = uploadService
        self.activityService = activityService

    }

    // MARK: Functions

    func start() {

        healthService?.authoriseHealthKitAccess { [weak self] isAuthorized in
            guard let self = self, isAuthorized else {
                return
            }

            self.uploadService?.getInterval { [weak self] result in
                switch result {
                case .success(let model):
                    guard let startDate = model.dateBegin.date, let endDate = model.dateFinish.date  else {
                        return
                    }
                    self?.getActivityUploadData(startDate: startDate, endDate: endDate)

                case .failure(let error):
                    let errorViewData = ErrorViewData(error: error)
                //self.state = .error(viewData: errorViewData)
                }
            }

        }
    }

    func getActivityViewData() {
        let dispatchGroup = DispatchGroup()
        let now = Date()
        let startDay = now.startOfDay
        let endDay = now.endOfDay


        //Steps daily
        dispatchGroup.enter()
        self.healthService?.getStepCount(startDay, endDay) { steps in
            DispatchQueue.main.async {
                self.steps = String(Int(steps))
            }
            dispatchGroup.leave()
        }

        //Sleep daily
        dispatchGroup.enter()
        self.healthService?.getSleepAnalysis(startDay - Const.hourSeconds * 6, endDay - Const.hourSeconds * 6) { samples, _ in
            let overall = samples.map { $0.endDate.timeIntervalSince($0.startDate) }.reduce(0, +)
            DispatchQueue.main.async {
                self.activitiesData.sleepHours = Double(overall / 3600).roundTo(2)
            }
            dispatchGroup.leave()
        }

        //Distance daily
        dispatchGroup.enter()
        self.healthService?.getDailyDistance(startDay, endDay) { meters in
            DispatchQueue.main.async {
                self.kilometers = String((meters / 1000).roundTo(2))
            }
            dispatchGroup.leave()
        }

        //Calories daily
        dispatchGroup.enter()
        self.healthService?.getActiveEnergyBurned(startDay, endDay) { samples, unit in
            DispatchQueue.main.async {
                self.calories = String(Int(samples.map { $0.quantity.doubleValue(for: unit) }.reduce(0, +)))
            }
            dispatchGroup.leave()
        }


        //Distance, Steps, Calories weekly
        for i in 0..<Const.daysInWeek {
            let startDay = now.addingTimeInterval(-Const.daySeconds * Double(i + 1)).startOfDay
            let endDay = now.addingTimeInterval(-Const.daySeconds * Double(i)).startOfDay

            dispatchGroup.enter()
            self.healthService?.getStepCount(startDay, endDay) { steps in
                self.chartData.steps[i] = Int(steps)
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            self.healthService?.getDailyDistance(startDay, endDay) { meters in
                self.chartData.distance[i] = (meters / 1000).roundTo(2)
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            self.healthService?.getActiveEnergyBurned(startDay, endDay) { samples, unit in
                self.chartData.calories[i] = Int(samples.map { $0.quantity.doubleValue(for: unit) }.reduce(0, +))
                dispatchGroup.leave()
            }

        }

        dispatchGroup.enter()
        self.activityService?.getActivityIndex { result in
            switch result {
            case .success(let data):
                self.initTestData()
                self.userData.activityIndex = Double(data.activityIndex)
                self.userData.yesterdayActivityIndex = Double(data.yesterdayActivityIndex)
                dispatchGroup.leave()

            case .failure(let error):
                print("Failure")
                dispatchGroup.leave()
            }
        }




        dispatchGroup.notify(queue: DispatchQueue.main) { [weak self] in
            guard let self = self else {
                return
            }

            self.updateUser?(self.userData)
            self.updateChart?(self.chartData, self.selectedActivitytype)

            // Request location + notification auth
            self.locationManager.requestAlwaysAuthorization()
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { didAllow, error in
            })
        }
    }

    private func initTestData() {

        //Temporary hard data(waiting for backend)
        self.userData.yesterdayActivityIndex = 37
        self.userData.avatarImage = UIImage(named: "user-avatar")!
        self.userData.normalStatus = "Ленивец"
        self.userData.todayStatus = "Гепард"
        self.userData.points = "150"
        self.userData.motivation = "двигайся больше..."
    }

    func getActivityUploadData(startDate: Date, endDate: Date) {

        let dispatchGroup = DispatchGroup()

        //StepCount
        dispatchGroup.enter()
        self.healthService?.getStepCount(startDate, endDate) { [weak self] samples, unit in
            self?.data.stepCount = samples.map { IntDataSample(value: Int($0.quantity.doubleValue(for: unit)), date: $0.startDate.format()) }
            dispatchGroup.leave()
        }

        //DistanceWalkingRunning
        dispatchGroup.enter()
        self.healthService?.getDistanceWalkingRunning(startDate, endDate) { [weak self] samples, unit in
            self?.data.distanceWalkingRunning = samples.map { IntDataSample(value: Int($0.quantity.doubleValue(for: unit)), date: $0.startDate.format()) }
            dispatchGroup.leave()
        }

        //FlightsClimbed
        dispatchGroup.enter()
        self.healthService?.getFlightsClimbed(startDate, endDate) { [weak self] samples, unit in
            self?.data.flightsClimbed = samples.map { IntDataSample(value: Int($0.quantity.doubleValue(for: unit)), date: $0.startDate.format()) }
            dispatchGroup.leave()
        }

        //ActiveEnergyBurned
        dispatchGroup.enter()
        self.healthService?.getActiveEnergyBurned(startDate, endDate) { [weak self] samples, unit in
            self?.data.activeEnergyBurned = samples.map { DoubleDataSample(value: $0.quantity.doubleValue(for: unit), date: $0.startDate.format()) }
            dispatchGroup.leave()
        }

        //OxygenSaturation
        dispatchGroup.enter()
        self.healthService?.getOxygenSaturation(startDate, endDate) { [weak self] samples, unit in
            self?.data.oxygenSaturation = samples.map { DoubleDataSample(value: $0.quantity.doubleValue(for: unit), date: $0.startDate.format()) }
            dispatchGroup.leave()
        }

        //Height
        dispatchGroup.enter()
        self.healthService?.getHeight(startDate, endDate) { [weak self] samples, unit in
            self?.data.height = samples.map { DoubleDataSample(value: $0.quantity.doubleValue(for: unit), date: $0.startDate.format()) }
            dispatchGroup.leave()
        }

        //BodyMass
        dispatchGroup.enter()
        self.healthService?.getBodyMass(startDate, endDate) { [weak self] samples, unit in
            self?.data.height = samples.map { DoubleDataSample(value: $0.quantity.doubleValue(for: unit), date: $0.startDate.format()) }
            dispatchGroup.leave()
        }

        //BodyMassIndex
        dispatchGroup.enter()
        self.healthService?.getBodyMassIndex(startDate, endDate) { [weak self] samples, unit in
            self?.data.height = samples.map { DoubleDataSample(value: $0.quantity.doubleValue(for: unit), date: $0.startDate.format()) }
            dispatchGroup.leave()
        }

        //HeartRate
        dispatchGroup.enter()
        self.healthService?.getHeartRate(startDate, endDate) { [weak self] samples, unit in
            self?.data.heartRate = samples.map { IntDataSample(value: Int($0.quantity.doubleValue(for: unit)), date: $0.startDate.format()) }
            dispatchGroup.leave()
        }

        //BloodPressureSystolic
        dispatchGroup.enter()
        self.healthService?.getBloodPressureSystolic(startDate, endDate) { [weak self] samples, unit in
            self?.data.bloodPressureSystolic = samples.map { IntDataSample(value: Int($0.quantity.doubleValue(for: unit)), date: $0.startDate.format()) }
            dispatchGroup.leave()
        }

        //BloodPressureDiastolic
        dispatchGroup.enter()
        self.healthService?.getBloodPressureDiastolic(startDate, endDate) { [weak self] samples, unit in
            self?.data.bloodPressureDiastolic = samples.map { IntDataSample(value: Int($0.quantity.doubleValue(for: unit)), date: $0.startDate.format()) }
            dispatchGroup.leave()
        }

        //SleepAnalysis
        dispatchGroup.enter()
        self.healthService?.getSleepAnalysis(startDate, endDate) { [weak self] samples, _ in
            self?.data.sleepAnalysis = samples.map { IntDataSample(value: Int($0.endDate.timeIntervalSince($0.startDate)), date: $0.startDate.format()) }
            dispatchGroup.leave()
        }

        dispatchGroup.notify(queue: DispatchQueue.main) { [weak self] in
            self?.uploadData()
        }
    }

    private func uploadData() {
        uploadService?.uploadData(data: data) { result in
            print(result)
        }
    }

    func activityItemDidTap(_ type: ChartType) {
        switch type {
        case .steps:
            updateChart?(chartData, .steps)
            selectedActivitytype = .steps
        case .calories:
            updateChart?(chartData, .calories)
            selectedActivitytype = .calories
        case .distance:
            updateChart?(chartData, .distance)
            selectedActivitytype = .distance

        }
    }

    func profileDidTap(controller: UIViewController) {
        coordinatorDelegate?.openProfile(controller: controller)
    }

    func back(from controller: UIViewController) {
        coordinatorDelegate?.close(from: controller)
    }

}
