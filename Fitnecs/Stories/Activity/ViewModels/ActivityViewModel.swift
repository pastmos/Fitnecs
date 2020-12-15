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
    func close(from controller: UIViewController)
}

protocol ActivityViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: ActivityViewModelCoordinatorDelegate? { get set }


    // MARK: Data Sources


    // MARK: Callbacks

    var updateState: ((ActivityState) -> Void)? { get set }
    var updateScreen: ((ActivityViewData) -> Void)? { get set }


    // MARK: Events

    func start()
    func getActivityViewData()
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
    var healthService: HealthKitServiceProtocol?
    var uploadService: UploadAPIService?

    var data: ActivityData = ActivityData()
    var viewData: ActivityViewData = ActivityViewData()

    // MARK: Callbacks

    var updateState: ((ActivityState) -> Void)?
    var updateScreen: ((ActivityViewData) -> Void)?

    let locationManager = CLLocationManager()

    var weekSteps: [Double] = [0, 0, 0, 0, 0, 0, 0]

    var userAvatar: UIImage?

    var userData: UserViewData?
    var activitiesData: ActivityViewData?
    var chartData: ChartViewData?

    init(healthService: HealthKitServiceProtocol = HealthKitService(), uploadService: UploadAPIService = UploadAPIServiceImplementation()) {
        self.healthService = healthService
        self.uploadService = uploadService
    }

    // MARK: Functions

    func start() {

        healthService?.authoriseHealthKitAccess{ [weak self] isAuthorized in
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

            self.getActivityViewData()
        }
    }

    func getActivityViewData() {
        let dispatchGroup = DispatchGroup()
        let now = Date()
        let startDay = now.startOfDay
        let endDay = now.endOfDay


        dispatchGroup.enter()
        self.healthService?.getStepCount(startDay, endDay) { steps in
            self.viewData.steps = steps
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        self.healthService?.getSleep(startDay - Const.hourSeconds * 6, endDay - Const.hourSeconds * 6, limit: 100) { samples, _ in
            defer {
                dispatchGroup.leave()
            }
            guard let samples = samples as? [HKCategorySample], !samples.isEmpty else {
                return
            }
            let overall = samples.map { $0.endDate.timeIntervalSince($0.startDate) }.reduce(0, +)

            self.viewData.sleepHours = Double(overall / 3600).roundTo(2)
        }

        dispatchGroup.enter()
        self.healthService?.getDailyDistance(startDay, endDay) { meters in
            self.viewData.kilometers = (meters / 1000).roundTo(2)
            dispatchGroup.leave()
        }


        for i in 0..<Const.daysInWeek {
            let startDay = now.addingTimeInterval(-Const.daySeconds * Double(i + 1)).startOfDay
            let endDay = now.addingTimeInterval(-Const.daySeconds * Double(i)).startOfDay

            dispatchGroup.enter()
            self.healthService?.getStepCount(startDay, endDay) { steps in
                self.weekSteps[i] = steps
                dispatchGroup.leave()
            }
        }


        dispatchGroup.notify(queue: DispatchQueue.main) { [weak self] in
            guard let self = self else {
                return
            }

            self.updateScreen?(self.viewData)

            // Request for use in background
            self.locationManager.requestAlwaysAuthorization()
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
            })
        }

    }

    private func getActivityUploadData(startDate: Date, endDate: Date) {

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
            self?.data.sleepAnalysis = samples.map {IntDataSample(value: Int($0.endDate.timeIntervalSince($0.startDate)), date: $0.startDate.format()) }
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

    func back(from controller: UIViewController) {
        coordinatorDelegate?.close(from: controller)
    }

}
