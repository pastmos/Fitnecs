//
//  LoginViewModel.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 11/20/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit

protocol AuthViewModelCoordinatorDelegate: AnyObject {
    func openMainInterface()
    func close(from controller: UIViewController)
}


protocol LoginViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: AuthViewModelCoordinatorDelegate? { get set }


    // MARK: Data Sources


    var phone: String {get set}

    // MARK: Callbacks

    var updateState: ((LoginViewDataState) -> Void)? { get set }
    var updateScreen: ((LoginViewDataType) -> Void)? { get set }


    // MARK: Events

    func start()
    func openMainInterface()
    func back(from controller: UIViewController)

}

class LoginViewModel: LoginViewModelProtocol {

    // MARK: Delegates

    weak var coordinatorDelegate: AuthViewModelCoordinatorDelegate?


    // MARK: Data Sources




    // MARK: Callbacks

    var updateState: ((LoginViewDataState) -> Void)?
    var updateScreen: ((LoginViewDataType) -> Void)?
    
    var phone: String = ""


    // MARK: Events

    func start() {
        state = .normal
        updateScreen?(loginViewData)
    }

    func next(from controller: UIViewController) {
        state = .loading

        authorizationAPIService.login(login: loginViewData.login, password: loginViewData.password) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let model):
                self.storageService.saveInUserDefaults(string: UUID().uuidString, with: .secretKey)
                self.storageService.saveInKeychain(string: model.token, with: KeychainStorage.Key.token)
                self.storageService.saveInKeychain(string: self.loginViewData.login, with: KeychainStorage.Key.username)
                self.storageService.saveInKeychain(string: self.loginViewData.password, with: KeychainStorage.Key.password)
                self.state = .normal

               

            case .failure(let error):
                if error == .notConnectedToInternet {
                    self.state = .normal
                    let alertViewData = AlertViewData.viewData(with: error)
//                    self.coordinatorDelegate?.showInfoAlert(with: alertViewData, from: controller)
                }
                else {
                    let errorViewData = ErrorViewData(error: error)
                    self.state = .error(viewData: errorViewData)
                }
            }
        }
    }
    
    func openMainInterface() {
        coordinatorDelegate?.openMainInterface()
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
    private var loginViewData: LoginViewDataType {
        didSet {
            updateScreen?(loginViewData)
        }
    }

}
