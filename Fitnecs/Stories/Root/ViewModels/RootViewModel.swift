//
//  RootViewModel.swift
//  VTBMobile
//
//  Created by Panov Sergey on 5/30/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Foundation

protocol RootViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: RootViewModelCoordinatorDelegate? { get set }

    var updateState: ((LoginViewDataState) -> Void)? { get set }

    // MARK: Events

    func start()

}


protocol RootViewModelCoordinatorDelegate: AnyObject {

    //func openOnboarding()
    func openAuth()
    func openMain()
    //func openCode()
    //func openPassword()

}


class RootViewModel: RootViewModelProtocol {

    var updateState: ((LoginViewDataState) -> Void)?


    // MARK: Delegates

    weak var coordinatorDelegate: RootViewModelCoordinatorDelegate?


    // MARK: Events

    func start() {
        state = .normal
        openApp()
    }


    // MARK: Initializers

    init(storageService: StorageService = StorageServiceImplementation(), authorizationAPIService: AuthorizationAPIService = AuthorizationAPIServiceImplementation(), state: LoginViewDataState = .normal) {
        self.storageService = storageService
        self.authorizationAPIService = authorizationAPIService
        self.state = state
    }


    // MARK: Private

    private let storageService: StorageService
    private let authorizationAPIService: AuthorizationAPIService

    private func clearKeychain() {
        storageService.removeFromKeychain(forKeys: [KeychainStorage.Key.token,
                                                    KeychainStorage.Key.username,
                                                    KeychainStorage.Key.password])
        storageService.removeFromUserDefaults(forKey: .secretKey)
    }

    private func openApp() {
        guard let email = self.storageService.stringFromKeychain(with: KeychainStorage.Key.username),
              let password = self.storageService.stringFromKeychain(with: KeychainStorage.Key.password),
              !email.isEmpty,
              !password.isEmpty else {
            clearKeychain()
            coordinatorDelegate?.openAuth()
            return
        }

        let data = LoginViewData(email: email, password: password)
        login(data)
    }

    private func login(_ data: LoginViewData) {

        state = .loading
        authorizationAPIService.login(data: data) { [weak self] result in
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
                self.storageService.saveInKeychain(string: data.email, with: KeychainStorage.Key.username)
                self.storageService.saveInKeychain(string: data.password, with: KeychainStorage.Key.password)
                //self.state = .normal

                self.state = .normal
                self.coordinatorDelegate?.openMain()

            case .failure(let error):
                //let errorViewData = ErrorViewData(error: error)
                //self.state = .error(viewData: errorViewData)
                self.coordinatorDelegate?.openAuth()
            }
        }

    }

    private var state: LoginViewDataState {
        didSet {
            updateState?(state)
        }
    }
}


// MARK: - UserDefaultsStorage

extension UserDefaultsStorage.Key {

//    static let firstLunch = UserDefaultsStorage.Key("was-lunched-before")
//    static let needRateApp = UserDefaultsStorage.Key("is-rate-app")
//    static let confirmation = UserDefaultsStorage.Key("confirmation")

}

extension KeychainStorage.Key {

    static let token = KeychainStorage.Key("token")
    static let username = KeychainStorage.Key("username")
    static let password = KeychainStorage.Key("password")
}

extension UserDefaultsStorage.Key {
    static let secretKey = UserDefaultsStorage.Key("SecretKey")
}
