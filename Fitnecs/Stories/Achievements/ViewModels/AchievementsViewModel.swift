//
//  AchievementsViewModel.swift
//  Fitnecs
//
//  Created by Panov Sergey on 20.10.2020.
//

import UIKit

protocol AchievementsViewModelCoordinatorDelegate: AnyObject {
    func close(from controller: UIViewController)
}

protocol AchievementsViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: AchievementsViewModelCoordinatorDelegate? { get set }


    // MARK: Data Sources


    // MARK: Callbacks

    var updateState: ((AchievementsState) -> Void)? { get set }
    var updateScreen: ((ChartStatisticsViewData) -> Void)? { get set }


    // MARK: Events

    func start()
    func back(from controller: UIViewController)

}

enum AchievementsState {
    case normal
    case loading
    case error(viewData: ErrorViewDataType)
}

class AchievementsViewModel: AchievementsViewModelProtocol {

    // MARK: Delegates
    weak var coordinatorDelegate: AchievementsViewModelCoordinatorDelegate?

    // MARK: Variables

    // MARK: Callbacks

    var updateState: ((AchievementsState) -> Void)?
    var updateScreen: ((ChartStatisticsViewData) -> Void)?


    init() {

    }

    // MARK: Functions

    func start() {


    }


    func back(from controller: UIViewController) {
        coordinatorDelegate?.close(from: controller)
    }

}
