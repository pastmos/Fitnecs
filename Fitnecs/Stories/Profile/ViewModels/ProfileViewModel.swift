//
//  ProfileViewModel.swift
//  Fitnecs
//
//  Created by Panov Sergey on 20.10.2020.
//

import UIKit

protocol ProfileViewModelCoordinatorDelegate: AnyObject {
    func close(from controller: UIViewController)
}

protocol ProfileViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: ProfileViewModelCoordinatorDelegate? { get set }


    // MARK: Data Sources


    // MARK: Callbacks

    var updateState: ((ProfileState) -> Void)? { get set }
    var updateScreen: ((ChartStatisticsViewData) -> Void)? { get set }


    // MARK: Events

    func start()
    func back(from controller: UIViewController)

}

enum ProfileState {
    case normal
    case loading
    case error(viewData: ErrorViewDataType)
}

class ProfileViewModel: ProfileViewModelProtocol {

    // MARK: Delegates
    weak var coordinatorDelegate: ProfileViewModelCoordinatorDelegate?

    // MARK: Variables

    // MARK: Callbacks

    var updateState: ((ProfileState) -> Void)?
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
