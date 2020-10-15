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
    var updateScreen: ((ChartActivityViewData) -> Void)? { get set }


    // MARK: Events

    func start()
    func back(from controller: UIViewController)
    func getWeekDays() -> [String]

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
    var updateScreen: ((ChartActivityViewData) -> Void)?

    let locationManager = CLLocationManager()

    var todaySteps: Double = 0

    struct Const {
        static let daySeconds: Double = 86400
    }

    init(healthService: HealthKitServiceProtocol = HealthKitService()) {
        self.healthService = healthService
    }

    // MARK: Functions

    func start() {

        healthService?.authoriseHealthKitAccess() { [weak self] isAuthorized in

            guard let self = self else {
                return
            }

            let dispatchGroup = DispatchGroup()

            if isAuthorized {
                let now = Date()

                for i in 0..<7 {
                    let startDay = now.addingTimeInterval(-ActivityViewModel.Const.daySeconds * Double(i + 1)).startOfDay
                    let endDay = now.addingTimeInterval(-ActivityViewModel.Const.daySeconds * Double(i)).startOfDay

                    dispatchGroup.enter()
                    self.healthService?.getStepCount(startDate: startDay, endDate: endDay) { steps in
                        self.viewData.weekSteps[i] = Int(steps)
                        dispatchGroup.leave()
                    }

                    dispatchGroup.enter()
                    self.healthService?.getDailyDistance(startDate: startDay, endDate: endDay) { distance in
                        self.viewData.distanceWalk[i] = distance.roundTo(2)
                        dispatchGroup.leave()
                    }

                    dispatchGroup.enter()
                    self.healthService?.getActiveEnergyBurned(startDate: startDay, endDate: endDay) { energy in
                        self.viewData.activeEnergyBurned[i] = Int(energy)
                        dispatchGroup.leave()
                    }

                    dispatchGroup.enter()
                    self.healthService?.getOxygenSaturation(startDate: startDay, endDate: endDay) { percent in
                        self.viewData.oxygenSaturation[i] = Int(percent*100)
                        dispatchGroup.leave()
                    }

                    dispatchGroup.enter()
                    self.healthService?.getHeartRate(startDate: startDay, endDate: endDay, limit: 100) { samples, unit in
                        defer {
                            dispatchGroup.leave()
                        }
                        guard let samples = samples as? [HKQuantitySample], !samples.isEmpty else {
                            return
                        }
                        let average = samples.map{$0.quantity.doubleValue(for: unit)}.reduce(0, +) / Double(samples.count)

                        self.viewData.heartRate[i] = Int(average)
                    }

                    dispatchGroup.enter()
                    self.healthService?.getSleep(startDate: startDay - 3600*6, endDate: endDay - 3600*6, limit: 100) { samples, unit in
                        defer {
                            dispatchGroup.leave()
                        }
                        guard let samples = samples as? [HKCategorySample], !samples.isEmpty else {
                            return
                        }
                        let average = samples.map{$0.endDate.timeIntervalSince($0.startDate)}.reduce(0, +) / Double(samples.count) / 3600

                        self.viewData.sleepHours[i] = Double(average).roundTo(2)
                    }
                }

                dispatchGroup.enter()
                let startDay = now.startOfDay
                self.healthService?.getStepCount(startDate: startDay, endDate: now) { steps in
                    self.viewData.stepsToday = Int(steps)
                    dispatchGroup.leave()
                }

                dispatchGroup.enter()
                self.healthService?.getHeight { samples, unit in
                    guard let sample = samples?.first as? HKQuantitySample else {
                        return
                    }
                    let height = sample.quantity.doubleValue(for: unit)
                    self.viewData.height = height

                    dispatchGroup.leave()
                }

                dispatchGroup.enter()
                self.healthService?.getWeight { samples, unit in
                    guard let sample = samples?.first as? HKQuantitySample else {
                        return
                    }
                    let weight = sample.quantity.doubleValue(for: unit) / 1000
                    self.viewData.weight = weight

                    dispatchGroup.leave()
                }


                dispatchGroup.notify(queue: DispatchQueue.main) { [weak self] in
                    guard let self = self else {
                        return
                    }

                    self.updateScreen?(self.viewData.chart)

                    // Request for use in background
                    self.locationManager.requestAlwaysAuthorization()
                }
            }
        }
    }


    func getWeekDays() -> [String] {
        let date = Date()
        return date.lastWeekDaysArray()
    }


    func back(from controller: UIViewController) {
        coordinatorDelegate?.close(from: controller)
    }

}
