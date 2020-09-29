//
//  ActivityViewModel.swift
//  Fitnecs
//
//  Created by Panov Sergey on 27.09.2020.
//

import UIKit

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
            if isAuthorized {
                let now = Date()
                let today = now.startOfDay
                let yesterday = now.addingTimeInterval(-ActivityViewModel.Const.daySeconds).startOfDay
                let beforeYesterday = now.addingTimeInterval(-2 * ActivityViewModel.Const.daySeconds).startOfDay

                self?.healthService?.getStepCount(startDate: yesterday, endDate: today) { steps, error in
                    self?.todaySteps = steps ?? 0
                }
            }
        }
    }
    
    func back(from controller: UIViewController) {
        coordinatorDelegate?.close(from: controller)
    }

}

