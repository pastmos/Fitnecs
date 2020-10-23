//
//  LoginViewModel.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 11/20/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit

protocol AuthViewModelCoordinatorDelegate: ViewModelCoordinatorDelegate {
    func openMainInterface()
    func openRegistartion(from controller: UIViewController)
}


protocol LoginViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: AuthViewModelCoordinatorDelegate? { get set }


    // MARK: Data Sources

    // MARK: Callbacks

    var updateState: ((LoginViewDataState) -> Void)? { get set }
    var updateScreen: ((LoginViewDataType) -> Void)? { get set }


    // MARK: Events

    func start()
    func login(login: String, password: String)
    func openRegistartion(from controller: UIViewController)
    func back(from controller: UIViewController)

}

class LoginViewModel: LoginViewModelProtocol {

    // MARK: Delegates

    weak var coordinatorDelegate: AuthViewModelCoordinatorDelegate?


    // MARK: Data Sources

    // MARK: Callbacks

    var updateState: ((LoginViewDataState) -> Void)?
    var updateScreen: ((LoginViewDataType) -> Void)?


    // MARK: Events

    func start() {
        state = .normal
    }

    
    func login(login: String, password: String) {

        loginViewData.login = login
        loginViewData.password = password
        updateScreen?(loginViewData)

        guard loginViewData.isLoginDataValid else {
            return
        }

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

                self.coordinatorDelegate?.openMainInterface()

            case .failure(let error):
                let errorViewData = ErrorViewData(error: error)
                self.state = .error(viewData: errorViewData)
            }
        }


        self.coordinatorDelegate?.openMainInterface()
    }


    func openRegistartion(from controller: UIViewController) {
        coordinatorDelegate?.openRegistartion(from: controller)
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
