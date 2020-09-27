//
//  GeoCoordinator.swift
//  Fitnecs
//
//  Created by Past on 27.09.2020.
//

import UIKit

protocol GeoCoordinatorDelegate: AnyObject {
    func didFinish(from coordinator: GeoCoordinator)
}


// MARK: - Coordinator

class GeoCoordinator: Coordinator {

    // MARK: Properties

    weak var delegate: GeoCoordinatorDelegate?
    
    override init() {
       
    }
    
    override func start() {

    }
    
}

extension GeoCoordinator: GeoViewModelCoordinatorDelegate {
   
    
}

