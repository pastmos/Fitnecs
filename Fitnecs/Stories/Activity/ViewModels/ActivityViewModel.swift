//
//  ActivityViewModel.swift
//  Fitnecs
//
//  Created by Panov Sergey on 27.09.2020.
//

import UIKit
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
    var healthService: HealthKitService?

    var viewData: ActivityViewData = ActivityViewData()
    var weekSteps: [Int] = [0,0,0,0,0,0,0]


    // MARK: Callbacks

    var updateState: ((ActivityState) -> Void)?
    var updateScreen: ((ActivityViewData) -> Void)?

    var todaySteps: Double = 0

    struct Const {
        static let daySeconds: Double = 86400
    }

    init(healthService: HealthKitService = HealthKitService()) {
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
                    dispatchGroup.enter()
                    let startDay = now.addingTimeInterval(-ActivityViewModel.Const.daySeconds * Double(i + 1)).startOfDay
                    let endDay = now.addingTimeInterval(-ActivityViewModel.Const.daySeconds * Double(i)).startOfDay
                    self.healthService?.getStepCount(startDate: startDay, endDate: endDay, startOrder: i) { steps, error in
                        self.weekSteps[i] = (Int(steps ?? 0))
                        dispatchGroup.leave()
                    }
                }

                dispatchGroup.enter()
                let startDay = now.startOfDay
                self.healthService?.getStepCount(startDate: startDay, endDate: now, startOrder: 0) { steps, error in
                    self.viewData.stepsToday = String(describing: Int(steps ?? 0)) + " " + "шагов"
                    dispatchGroup.leave()
                }

                dispatchGroup.notify(queue: DispatchQueue.main) { [weak self] in
                    guard let self = self else {
                        return
                    }

                    self.viewData.chartData = self.createBarsArr(array: self.weekSteps)
                    self.updateScreen?(self.viewData)
                }
            }
        }
    }


    private func createBarsArr(array: [Int]) -> BarLineScatterCandleBubbleChartData {
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<array.count {
          let dataEntry = BarChartDataEntry(x: Double(i+1), y: Double(array[i]))
          dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Количество шагов в день")
        let chartData = BarChartData(dataSet: chartDataSet)
        return chartData
    }

    func back(from controller: UIViewController) {
        coordinatorDelegate?.close(from: controller)
    }

}

