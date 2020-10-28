//
//  StatisticsViewModel.swift
//  Fitnecs
//
//  Created by Panov Sergey on 16.10.2020.
//

import UIKit
import GoogleMaps
import HealthKit
import Charts


protocol StatisticsViewModelCoordinatorDelegate: AnyObject {
    func close(from controller: UIViewController)
}

protocol StatisticsViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: StatisticsViewModelCoordinatorDelegate? { get set }


    // MARK: Data Sources


    // MARK: Callbacks

    var updateState: ((StatisticsState) -> Void)? { get set }
    var updateScreen: ((ChartStatisticsViewData) -> Void)? { get set }


    // MARK: Events

    func start()
    func back(from controller: UIViewController)
    func getWeekDays() -> [String]

}

enum StatisticsState {
    case normal
    case loading
    case error(viewData: ErrorViewDataType)
}

class StatisticsViewModel: StatisticsViewModelProtocol {

    // MARK: Delegates
    weak var coordinatorDelegate: StatisticsViewModelCoordinatorDelegate?

    // MARK: Variables
    var healthService: HealthKitServiceProtocol?

    var viewData: StatisticsViewData = StatisticsViewData()

    // MARK: Callbacks

    var updateState: ((StatisticsState) -> Void)?
    var updateScreen: ((ChartStatisticsViewData) -> Void)?

    let locationManager = CLLocationManager()

    var todaySteps: Double = 0


    init(healthService: HealthKitServiceProtocol = HealthKitService()) {
        self.healthService = healthService
    }

    // MARK: Functions

    func start() {

        healthService?.authoriseHealthKitAccess() { [weak self] isAuthorized in

            guard let self = self, isAuthorized else {
                return
            }

//            let dispatchGroup = DispatchGroup()
//            let now = Date()
//
//            for i in 0..<Const.daysInWeek {
//                let startDay = now.addingTimeInterval(-Const.daySeconds * Double(i + 1)).startOfDay
//                let endDay = now.addingTimeInterval(-Const.daySeconds * Double(i)).startOfDay
//
//                dispatchGroup.enter()
//                self.healthService?.getStepCount(startDate: startDay, endDate: endDay) { steps in
//                    self.viewData.weekSteps[i] = Int(steps)
//                    dispatchGroup.leave()
//                }
//
//                dispatchGroup.enter()
//                self.healthService?.getDailyDistance(startDate: startDay, endDate: endDay) { distance in
//                    self.viewData.distanceWalk[i] = distance.roundTo(2)
//                    dispatchGroup.leave()
//                }
//
//                dispatchGroup.enter()
//                self.healthService?.getActiveEnergyBurned(startDate: startDay, endDate: endDay) { energy in
//                    self.viewData.activeEnergyBurned[i] = Int(energy)
//                    dispatchGroup.leave()
//                }
//
//                dispatchGroup.enter()
//                self.healthService?.getOxygenSaturation(startDate: startDay, endDate: endDay) { percent in
//                    self.viewData.oxygenSaturation[i] = Int(percent*100)
//                    dispatchGroup.leave()
//                }
//
//                dispatchGroup.enter()
//                self.healthService?.getBloodPressureSystolic(startDate: startDay, endDate: endDay) { pressure in
//                    self.viewData.bloodPressureSystolic[i] = Int(pressure)
//                    dispatchGroup.leave()
//                }
//
//                dispatchGroup.enter()
//                self.healthService?.getHeartRate(startDate: startDay, endDate: endDay, limit: 100) { samples, unit in
//                    defer {
//                        dispatchGroup.leave()
//                    }
//                    guard let samples = samples as? [HKQuantitySample], !samples.isEmpty else {
//                        return
//                    }
//                    let average = samples.map{$0.quantity.doubleValue(for: unit)}.reduce(0, +) / Double(samples.count)
//
//                    self.viewData.heartRate[i] = Int(average)
//                }
//
//                dispatchGroup.enter()
//                self.healthService?.getSleep(startDate: startDay - Const.hourSeconds*6, endDate: endDay - Const.hourSeconds*6, limit: 100) { samples, unit in
//                    defer {
//                        dispatchGroup.leave()
//                    }
//                    guard let samples = samples as? [HKCategorySample], !samples.isEmpty else {
//                        return
//                    }
//                    let average = samples.map{$0.endDate.timeIntervalSince($0.startDate)}.reduce(0, +) / Double(samples.count) / Const.hourSeconds
//
//                    self.viewData.sleepHours[i] = Double(average).roundTo(2)
//                }
//            }
//
//
//            dispatchGroup.notify(queue: DispatchQueue.main) { [weak self] in
//                guard let self = self else {
//                    return
//                }
//
//                self.updateScreen?(self.viewData.chart)
//            }
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
