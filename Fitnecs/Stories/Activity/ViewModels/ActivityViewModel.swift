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

    var updateState: ((LoginViewDataState) -> Void)? { get set }
    var updateScreen: ((LoginViewDataType) -> Void)? { get set }


    // MARK: Events

    func start()
    func back(from controller: UIViewController)

}

class ActivityViewModel: ActivityViewModelProtocol {

    // MARK: Delegates

    weak var coordinatorDelegate: ActivityViewModelCoordinatorDelegate?


    // MARK: Data Sources


    // MARK: Callbacks

    var updateState: ((LoginViewDataState) -> Void)?
    var updateScreen: ((LoginViewDataType) -> Void)?
    

    // MARK: Events

    func start() {
        
    }
    
    func back(from controller: UIViewController) {
        coordinatorDelegate?.close(from: controller)
    }

}
