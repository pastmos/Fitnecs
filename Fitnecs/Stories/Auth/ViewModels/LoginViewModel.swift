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
    func login(data: LoginViewDataType)
    func openRegistartion(from controller: UIViewController)
    func showErrorMassage(from controller: UIViewController, _ errorData: ErrorViewDataType)
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

        if let email = self.storageService.stringFromKeychain(with: KeychainStorage.Key.username),
              !email.isEmpty {
            loginViewData.email = email
        }
    }

    
    func login(data: LoginViewDataType) {

        loginViewData = data

        guard loginViewData.isLoginDataValid else {
            return
        }

        state = .loading

        authorizationAPIService.login(data: loginViewData) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let model):
                guard let token = model.token, !token.isEmpty else {
                    return
                }
                self.storageService.saveInUserDefaults(string: UUID().uuidString, with: .secretKey)
                self.storageService.saveInKeychain(string: token, with: KeychainStorage.Key.token)
                self.storageService.saveInKeychain(string: self.loginViewData.email, with: KeychainStorage.Key.username)
                self.storageService.saveInKeychain(string: self.loginViewData.password, with: KeychainStorage.Key.password)
                self.state = .normal

                self.coordinatorDelegate?.openMainInterface()

            case .failure(let error):
                let errorViewData = ErrorViewData(error: error)
                self.state = .error(viewData: errorViewData)
            }
        }

    }


    func openRegistartion(from controller: UIViewController) {
        coordinatorDelegate?.openRegistartion(from: controller)
    }

    func showErrorMassage(from controller: UIViewController, _ errorData: ErrorViewDataType) {
        let alert = AlertViewData(title: "Ошибка!", text: errorData.message, closeButtonTitle: "Ок", action: nil, close: nil)
        coordinatorDelegate?.showInfoAlert(with: alert, from: controller)//showErrorInfoAlert(from: controller)
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
