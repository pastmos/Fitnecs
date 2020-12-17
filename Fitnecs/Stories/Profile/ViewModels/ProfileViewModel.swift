//
//  ProfileViewModel.swift
//  Fitnecs
//
//  Created by Panov Sergey on 20.10.2020.
//

import UIKit

protocol ProfileViewModelCoordinatorDelegate: AnyObject {
    func openAuth()
    func close(from controller: UIViewController)
}

protocol ProfileViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: ProfileViewModelCoordinatorDelegate? { get set }


    // MARK: Data Sources


    // MARK: Callbacks

    var updateState: ((ProfileState) -> Void)? { get set }
    var updateScreen: ((ProfileViewData) -> Void)? { get set }


    // MARK: Events

    func start()
    func logout()
    func settings()
    func back(from controller: UIViewController)

}

enum ProfileState {
    case normal
    case loading
    case error(viewData: ErrorViewDataType)
}

class ProfileViewModel: ProfileViewModelProtocol {

    // MARK: Delegates
    weak var coordinatorDelegate: ProfileViewModelCoordinatorDelegate?

    // MARK: Variables

    var storageService: StorageService

    // MARK: Callbacks

    var updateState: ((ProfileState) -> Void)?
    var updateScreen: ((ProfileViewData) -> Void)?

    var state: ProfileState = .normal

    init(storageService: StorageService = StorageServiceImplementation()) {
        self.storageService = storageService
    }

    // MARK: Functions

    func start() {
        state = .loading

        //network request to be added later

        state = .normal
        let data = ProfileViewData(name: "Панов Сергей", email: "passt@yandex.ru", userImage: "user-avatar", points: "150")
        updateScreen?(data)

    }

    func back(from controller: UIViewController) {
        coordinatorDelegate?.close(from: controller)
    }

    func logout() {
        clearKeychain()
        coordinatorDelegate?.openAuth()
    }

    func settings() {
        
    }

    private func clearKeychain() {
        storageService.removeFromKeychain(forKeys: [KeychainStorage.Key.token,
                                                    KeychainStorage.Key.username,
                                                    KeychainStorage.Key.password])
        storageService.removeFromUserDefaults(forKey: .secretKey)
    }

}
