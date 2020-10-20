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

    var viewData: ActivityViewData = ActivityViewData()

    // MARK: Callbacks

    var updateState: ((ActivityState) -> Void)?
    var updateScreen: ((ActivityViewData) -> Void)?

    let locationManager = CLLocationManager()

    var weekSteps: [Double] = [0,0,0,0,0,0,0]

    init(healthService: HealthKitServiceProtocol = HealthKitService()) {
        self.healthService = healthService
    }

    // MARK: Functions

    func start() {

        healthService?.authoriseHealthKitAccess() { [weak self] isAuthorized in

            guard let self = self, isAuthorized else {
                return
            }

            let dispatchGroup = DispatchGroup()
            let now = Date()
            let startDay = now.startOfDay
            let endDay = now.endOfDay


            dispatchGroup.enter()
            self.healthService?.getStepCount(startDate: startDay, endDate: now) { steps in
                self.viewData.steps = steps
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            self.healthService?.getSleep(startDate: startDay - Const.hourSeconds*6, endDate: endDay - Const.hourSeconds*6, limit: 100) { samples, unit in
                defer {
                    dispatchGroup.leave()
                }
                guard let samples = samples as? [HKCategorySample], !samples.isEmpty else {
                    return
                }
                let overall = samples.map{$0.endDate.timeIntervalSince($0.startDate)}.reduce(0, +) / Const.hourSeconds

                self.viewData.sleep = Double(overall).roundTo(2)
            }

            dispatchGroup.enter()
            self.healthService?.getDailyDistance(startDate: startDay, endDate: now) { meters in
                self.viewData.distance = (meters/1000).roundTo(2)
                dispatchGroup.leave()
            }


            for i in 0..<Const.daysInWeek {
                let startDay = now.addingTimeInterval(-Const.daySeconds * Double(i + 1)).startOfDay
                let endDay = now.addingTimeInterval(-Const.daySeconds * Double(i)).startOfDay

                dispatchGroup.enter()
                self.healthService?.getStepCount(startDate: startDay, endDate: endDay) { steps in
                    self.weekSteps[i] = steps
                    dispatchGroup.leave()
                }
            }


            dispatchGroup.notify(queue: DispatchQueue.main) { [weak self] in
                guard let self = self else {
                    return
                }

                self.viewData.activityIndex = self.getActivityIndex(self.viewData)
                self.viewData.activityPoints = self.getActivityPoints(self.viewData)
                self.updateScreen?(self.viewData)

                // Request for use in background
                self.locationManager.requestAlwaysAuthorization()
            }
        }
    }

    private func getActivityIndex(_ viewData: ActivityViewData) -> Double{
        let index = weekSteps.reduce(0, +) / Double(Const.daysInWeek) / 100
        return index
    }

    private func getActivityPoints(_ viewData: ActivityViewData) -> String {
        return "67"
    }


    func back(from controller: UIViewController) {
        coordinatorDelegate?.close(from: controller)
    }

}
