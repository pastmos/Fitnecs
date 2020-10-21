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
    var awards: [AwardModel] { get }


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
    var awards: [AwardModel] = [
        AwardModel(isActivated: true, number: 1),
        AwardModel(isActivated: true, number: 2),
        AwardModel(isActivated: true, number: 3),
        AwardModel(isActivated: true, number: 4),
        AwardModel(isActivated: true, number: 5),
        AwardModel(isActivated: true, number: 6),
        AwardModel(isActivated: true, number: 7),
        AwardModel(isActivated: false, number: 8),
        AwardModel(isActivated: false, number: 9),
        AwardModel(isActivated: false, number: 10),
        AwardModel(isActivated: false, number: 11),
        AwardModel(isActivated: false, number: 12),
        AwardModel(isActivated: false, number: 13),
        AwardModel(isActivated: false, number: 14),
        AwardModel(isActivated: false, number: 15),
        AwardModel(isActivated: false, number: 16),
        AwardModel(isActivated: false, number: 17)
    ]

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
