//
//  MainViewModel.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 6/14/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import UIKit


protocol MainViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: MainViewModelCoordinatorDelegate? { get set }


    // MARK: Events

    func start(from: UIViewController)
}


protocol MainViewModelCoordinatorDelegate: ViewModelCoordinatorDelegate {
    func close(from controller: UIViewController)
}


class MainViewModel: MainViewModelProtocol {

    var userModel: UserModel?

    // MARK: Delegates

    weak var coordinatorDelegate: MainViewModelCoordinatorDelegate?


  
    // MARK: Initializers

    init() {
       
    }

    func start(from: UIViewController) {
        
    }

    // MARK: Private

 
   
}

