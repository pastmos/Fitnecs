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
    var updateScreen: ((RegisterViewDataType) -> Void)? { get set }


    // MARK: Events

    func start()
    func registration(from controller: UIViewController, data: RegisterViewDataType)
    func back(from controller: UIViewController)

}

class RegistrationViewModel: RegistrationViewModelProtocol {


    // MARK: Delegates

    weak var coordinatorDelegate: AuthViewModelCoordinatorDelegate?


    // MARK: Data Sources




    // MARK: Callbacks

    var updateState: ((LoginViewDataState) -> Void)?
    var updateScreen: ((RegisterViewDataType) -> Void)?


    // MARK: Events

    func start() {
        state = .normal
        //updateScreen?(loginViewData)
    }


    func registration(from controller: UIViewController, data: RegisterViewDataType) {
        self.registerViewData = data

        updateScreen?(registerViewData)

        guard registerViewData.isRegisterDataValid else {
            return
        }

        state = .loading

        authorizationAPIService.registration(data: registerViewData) { [weak self] result in

            switch result {
            case .success(let model):
                self?.state = .normal
                let alertViewData = AlertViewData(title: Strings.Auth.Registration.Alert.title,
                                                  text: Strings.Auth.Registration.Alert.text,
                                                  closeButtonTitle: Strings.Common.Button.Ok.title) { [weak self] in
                    self?.coordinatorDelegate?.close(from: controller)
                }
                self?.coordinatorDelegate?.showInfoAlert(with: alertViewData, from: controller)

            case .failure(let error):
                self?.coordinatorDelegate?.showErrorInfoAlert(from: controller)

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
        registerViewData = RegisterViewData()
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
    private var registerViewData: RegisterViewDataType

}
