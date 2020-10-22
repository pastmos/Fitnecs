//
//  RootCoordinator.swift
//  VTBMobile
//
//  Created by Panov Sergey on 5/30/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit


// MARK: - RootCoordinatorDelegate

protocol RootCoordinatorDelegate: AnyObject {

    func didFinish(from coordinator: RootCoordinator)

}


// MARK: - Coordinator

class RootCoordinator: Coordinator {

    // MARK: Properties

    let window: UIWindow?
    weak var delegate: RootCoordinatorDelegate?

    private lazy var rootViewController: RootViewController = {
        let viewModel = RootViewModel()
        viewModel.coordinatorDelegate = self

        let controller = Storyboards.Root.rootViewController.instantiate()
        controller.viewModel = viewModel

        return controller
    }()


    // MARK: Initialization

    init(window: UIWindow?) {
        self.window = window
    }


    // MARK: Coordinator

    override func start() {
        if let rootController = window?.rootViewController {
            rootController.dismiss(animated: false, completion: nil)
            rootController.view.removeFromSuperview()
            rootController.removeFromParent()
        }
        window?.rootViewController = rootViewController
    }

    override func finish() {
        delegate?.didFinish(from: self)
    }


}


// MARK: - Routing

extension RootCoordinator {

    func openOnboardingInterface() {
//        let onboardingCoordinator = OnboardingCoordinator(rootViewController: rootViewController)
//        onboardingCoordinator.delegate = self
//        addChildCoordinator(onboardingCoordinator)
//        onboardingCoordinator.start()
    }

    func openAuthInterface(with screen: AuthCoordinator.Screen, phone: String = "") {
        let authCoordinator = AuthCoordinator(rootViewController: rootViewController, screenToLoadFirst: screen)
        authCoordinator.phone = phone
        authCoordinator.delegate = self
        addChildCoordinator(authCoordinator)
        authCoordinator.start()
    }

    func openAuthInterface(from coordinator: Coordinator, with screen: AuthCoordinator.Screen, phone: String = "") {
        openAuthInterface(with: screen, phone: phone)
        coordinator.finish()
    }

    func openMainInterface() {
        let mainCoordinator = MainCoordinator(rootViewController: rootViewController)
        mainCoordinator.delegate = self
        addChildCoordinator(mainCoordinator)
        mainCoordinator.start()
    }

}


// MARK: - RootViewModelCoordinatorDelegate

extension RootCoordinator: RootViewModelCoordinatorDelegate {

    func openOnboarding() {
        openOnboardingInterface()
    }

    func openAuth() {
        openAuthInterface(with: .login)
    }

    func openMain() {
        openMainInterface()
    }

    func openCode() {
        openAuthInterface(with: .code)
    }

    func openPassword() {
        openAuthInterface(with: .password)
    }

}


// MARK: - AuthCoordinatorDelegate

extension RootCoordinator: AuthCoordinatorDelegate {

    func openMainInterface(from coordinator: AuthCoordinator) {
        openMainInterface()
        coordinator.finish()
    }

    func didFinish(from coordinator: AuthCoordinator) {
        removeChildCoordinator(coordinator)
    }

}


// MARK: - MainCoordinatorDelegate

extension RootCoordinator: MainCoordinatorDelegate {

    func didFinish(from coordinator: MainCoordinator) {
        removeChildCoordinator(coordinator)
    }

}
