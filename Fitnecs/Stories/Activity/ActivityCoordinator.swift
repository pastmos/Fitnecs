//
//  ActivityCoordinator.swift
//  Fitnecs
//
//  Created by Past on 27.09.2020.
//

import UIKit

protocol ActivityCoordinatorDelegate: AnyObject {
    func didFinish(from coordinator: ActivityCoordinator)
}


// MARK: - Coordinator

class ActivityCoordinator: Coordinator {

    // MARK: Properties

    weak var delegate: ActivityCoordinatorDelegate?
    
    override init() {
       
    }
    
    override func start() {
        
    }
    
}

extension ActivityCoordinator: ActivityViewModelCoordinatorDelegate {
   
    
}
