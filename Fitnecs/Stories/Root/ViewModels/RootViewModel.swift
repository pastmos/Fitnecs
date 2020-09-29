//
//  RootViewModel.swift
//  VTBMobile
//
//  Created by Panov Sergey on 5/30/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

protocol RootViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: RootViewModelCoordinatorDelegate? { get set }


    // MARK: Events

    func start()

}


protocol RootViewModelCoordinatorDelegate: AnyObject {

    func openOnboarding()
    func openAuth()
    func openMain()
    func openCode()
    func openPassword()

}


class RootViewModel: RootViewModelProtocol {

    // MARK: Delegates

    weak var coordinatorDelegate: RootViewModelCoordinatorDelegate?


    // MARK: Events

    func start() {
        openApp()
    }


    // MARK: Initializers

    init(storageService: StorageService = StorageServiceImplementation(), authorizationAPIService: AuthorizationAPIService = AuthorizationAPIServiceImplementation()) {
        self.storageService = storageService
        self.authorizationAPIService = authorizationAPIService
    }


    // MARK: Private

    private let storageService: StorageService
    private let authorizationAPIService: AuthorizationAPIService

    private func clearKeychain() {
        storageService.removeFromKeychain(forKeys: [KeychainStorage.Key.token,
                                                    KeychainStorage.Key.username,
                                                    KeychainStorage.Key.password,
                                                    KeychainStorage.Key.code])
        storageService.removeFromUserDefaults(forKey: .secretKey)
    }

    private func openApp() {
        if let wasLunchedBefore = storageService.boolFromUserDefaults(with: UserDefaultsStorage.Key.firstLunch), wasLunchedBefore {
            if let confirmationNumber = storageService.numberFromUserDefaults(with: UserDefaultsStorage.Key.confirmation) {
                switch ConfirmationModelType.type(number: confirmationNumber) {
                case .without:  coordinatorDelegate?.openMain()
                case .code:     coordinatorDelegate?.openCode()
                case .password: coordinatorDelegate?.openPassword()
                case .none:
                    coordinatorDelegate?.openAuth()
                }
            }
            else {
                coordinatorDelegate?.openAuth()
            }
        }
        else {
            clearKeychain()
            coordinatorDelegate?.openAuth()
        }
    }
}


// MARK: - UserDefaultsStorage

extension UserDefaultsStorage.Key {

    static let firstLunch = UserDefaultsStorage.Key("was-lunched-before")
    static let needRateApp = UserDefaultsStorage.Key("is-rate-app")
    static let confirmation = UserDefaultsStorage.Key("confirmation")

}

extension KeychainStorage.Key {

    static let token = KeychainStorage.Key("token")
    static let chatToken = KeychainStorage.Key("chatToken")
    static let username = KeychainStorage.Key("username")
    static let password = KeychainStorage.Key("password")
    static let userRegion = KeychainStorage.Key("userRegion")
    static let rootRegion = KeychainStorage.Key("rootRegion")
    static let code = KeychainStorage.Key("code")
}

extension UserDefaultsStorage.Key {
    static let secretKey = UserDefaultsStorage.Key("SecretKey")
}
