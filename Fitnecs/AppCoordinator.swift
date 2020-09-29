//
//  AppCoordinator.swift
//  Fitnecs
//
//  Created by Panov Sergey on 23.09.2020.
//

import UIKit
import Reachability
import SwiftMessages

// MARK: - Coordinator

class AppCoordinator: Coordinator {

    // MARK: Properties

    var authErrorHandler: AuthenticationErrorHandler?
    private var reachability: Reachability?
    private let storageService: StorageService
    let window: UIWindow?
    lazy var rootCoordinator = RootCoordinator(window: window)

    // MARK: Initializers

    init(window: UIWindow?, storageService: StorageService = StorageServiceImplementation()) {
        self.window = window
        self.storageService = storageService
    }


    // MARK: Coordinator

    override func start() {
        guard let window = window else {
            return
        }

        setupAuthenticationErrorHandler()
        showRootInterface()
        window.makeKeyAndVisible()

        reachability = Reachability()

        reachability?.reachableBlock = { [weak self] _ in
            self?.hideNoInternetMessage()
        }

        reachability?.unreachableBlock = { [weak self] _ in
            self?.showNoInternetMessage()
        }
        
        //reachability?.startNotifier()

    }

    override func finish() {

    }

    private func showNoInternetMessage() {
        guard let view: MessageView = try? SwiftMessages.viewFromNib(named: "NoConnectionMessage") else {
            return
        }
        view.configureContent(body: Strings.Network.Error.No.Connection.text)

        var config = SwiftMessages.defaultConfig
        config.duration = .forever
        config.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        config.interactiveHide = false

        SwiftMessages.show(config: config, view: view)
    }

    private func hideNoInternetMessage() {
        SwiftMessages.hide()
    }
    deinit {
        print("")
    }
}


// MARK: - Routing

extension AppCoordinator {

    func showRootInterface() {
        addChildCoordinator(rootCoordinator)
        rootCoordinator.delegate = self
        rootCoordinator.start()
    }

    func setupAuthenticationErrorHandler() {
        authErrorHandler = AuthenticationErrorHandler { [weak self] in
            self?.handleAuthentificationError()
        }
    }

    func handleAuthentificationError() {
        setupAuthenticationErrorHandler()
        clearAuthData()
        rootCoordinator.childCoordinators.forEach { $0.finish() }
        rootCoordinator.removeAllChildCoordinators()
        rootCoordinator.openAuthInterface(with: .login)
    }

    func clearAuthData() {
        storageService.removeFromKeychain(forKeys: [KeychainStorage.Key.token,
                                                    KeychainStorage.Key.username,
                                                    KeychainStorage.Key.password,
                                                    KeychainStorage.Key.code])
        storageService.removeFromUserDefaults(forKey: .confirmation)
        storageService.removeFromUserDefaults(forKey: .secretKey)
    }
}


// MARK: - RootCoordinatorDelegate

extension AppCoordinator: RootCoordinatorDelegate {

    func didFinish(from coordinator: RootCoordinator) {
        removeChildCoordinator(coordinator)
    }

}
