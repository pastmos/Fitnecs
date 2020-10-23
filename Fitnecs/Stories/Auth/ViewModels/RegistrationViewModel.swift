//
//  LoginViewModel.swift
//  VTBMobile
//
//  Created by Panov Sergey on 11/20/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit


protocol RegistrationViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: AuthViewModelCoordinatorDelegate? { get set }


    // MARK: Data Sources

    // MARK: Callbacks

    var updateState: ((LoginViewDataState) -> Void)? { get set }
    var updateScreen: ((LoginViewDataType) -> Void)? { get set }


    // MARK: Events

    func start()
    func registration(from controller: UIViewController, login: String, password: String)
    func back(from controller: UIViewController)

}

class RegistrationViewModel: RegistrationViewModelProtocol {


    // MARK: Delegates

    weak var coordinatorDelegate: AuthViewModelCoordinatorDelegate?


    // MARK: Data Sources




    // MARK: Callbacks

    var updateState: ((LoginViewDataState) -> Void)?
    var updateScreen: ((LoginViewDataType) -> Void)?


    // MARK: Events

    func start() {
        state = .normal
        //updateScreen?(loginViewData)
    }


    func registration(from controller: UIViewController, login: String, password: String) {
        self.loginViewData.login = login
        self.loginViewData.password = password

        updateScreen?(loginViewData)

        guard loginViewData.isLoginDataValid else {
            return
        }

        state = .loading

        authorizationAPIService.registration(login: loginViewData.login, password: loginViewData.password) { [weak self] result in

            switch result {
            case .success(let model):
                self?.state = .normal

            case .failure(let error):
                let errorViewData = ErrorViewData(error: error)
                self?.state = .error(viewData: errorViewData)
            }
        }
    }

 
    func back(from controller: UIViewController) {
        coordinatorDelegate?.close(from: controller)
    }


    // MARK: Initializers

    init(authorizationAPIService: AuthorizationAPIService = AuthorizationAPIServiceImplementation(),
         validationService: ValidationService = ValidationServiceImplementation(),
         storageService: StorageService = StorageServiceImplementation(),
         state: LoginViewDataState = .normal) {
        self.authorizationAPIService = authorizationAPIService
        self.validationService = validationService
        self.storageService = storageService
        self.state = state
        loginViewData = LoginViewData()
    }


    // MARK: Private

    private let authorizationAPIService: AuthorizationAPIService
    private let validationService: ValidationService
    private let storageService: StorageService
    private var state: LoginViewDataState {
        didSet {
            updateState?(state)
        }
    }
    private var loginViewData: LoginViewDataType

}
