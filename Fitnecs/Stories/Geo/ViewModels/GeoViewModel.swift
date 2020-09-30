//
//  GeoViewModel.swift
//  Fitnecs
//
//  Created by Panov Sergey on 27.09.2020.
//

import UIKit
import GoogleMaps

protocol GeoViewModelCoordinatorDelegate: AnyObject {
    func close(from controller: UIViewController)
}

protocol GeoViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: GeoViewModelCoordinatorDelegate? {get set}


    // MARK: Data Sources
    var currentLocation: CLLocationCoordinate2D? {get set}

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
    var currentLocation: CLLocationCoordinate2D?

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
