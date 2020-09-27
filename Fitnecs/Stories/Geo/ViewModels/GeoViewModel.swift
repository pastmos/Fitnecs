//
//  GeoViewModel.swift
//  Fitnecs
//
//  Created by Past on 27.09.2020.
//

import UIKit

protocol GeoViewModelCoordinatorDelegate: AnyObject {
    func close(from controller: UIViewController)
}

protocol GeoViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: GeoViewModelCoordinatorDelegate? { get set }


    // MARK: Data Sources


    // MARK: Callbacks

    var updateState: ((LoginViewDataState) -> Void)? { get set }
    var updateScreen: ((LoginViewDataType) -> Void)? { get set }


    // MARK: Events

    func start()
    func back(from controller: UIViewController)

}

class GeoViewModel: GeoViewModelProtocol {

    // MARK: Delegates

    weak var coordinatorDelegate: GeoViewModelCoordinatorDelegate?


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
