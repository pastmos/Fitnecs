//
//  AuthCoordinator.swift
//  VTBMobile
//
//  Created by Evgeniy Mikholap on 6/3/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import UIKit
import SafariServices

// MARK: - AuthCoordinatorDelegate

protocol AuthCoordinatorDelegate: AnyObject {

    func didFinish(from coordinator: AuthCoordinator)
    func openMainInterface(from coordinator: AuthCoordinator)

}


// MARK: - Coordinator

class AuthCoordinator: Coordinator {

    // MARK: Properties

    weak var delegate: AuthCoordinatorDelegate?

    private let rootViewController: RootViewController
    private let onboardingViewController: UIViewController?
    private let screenToLoadFirst: Screen
    private lazy var navigationController: UINavigationController = {
        var viewController: UIViewController

        switch screenToLoadFirst {
        case .login:    viewController = loginViewController
        case .phone:    viewController = UIViewController()
        case .code:     viewController = UIViewController()
        case .password: viewController = UIViewController()
        }

        let navigationController = BaseNavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        return navigationController
    }()
 
    private lazy var loginViewController: LoginViewController = {
        let viewModel = LoginViewModel()
        viewModel.coordinatorDelegate = self
        viewModel.phone = self.phone

        let loginViewController = Storyboards.Auth.loginViewController.instantiate()
        loginViewController.viewModel = viewModel
        return loginViewController
    }()
    
    var phone: String = ""
    

    enum Screen {
        case login, phone, code, password
    }


    // MARK: Initialization

    init(rootViewController: RootViewController,
         onboardingViewController: UIViewController? = nil,
         screenToLoadFirst: Screen = .login) {
        self.rootViewController = rootViewController
        self.onboardingViewController = onboardingViewController
        self.screenToLoadFirst = screenToLoadFirst
    }


    // MARK: Coordinator
    
    override func start() {
        
        rootViewController.addChild(navigationController)
        rootViewController.view.addSubview(navigationController.view)
        
        navigationController.view.snp.makeConstraints({ maker in
            maker.edges.equalToSuperview()
        })
        
        
        navigationController.didMove(toParent: rootViewController)
    }

    override func finish() {
        navigationController.willMove(toParent: nil)
        navigationController.view.removeFromSuperview()
        navigationController.removeFromParent()
        rootViewController.dismiss(animated: true, completion: nil)
        delegate?.didFinish(from: self)
    }

}


// MARK: - AuthViewModelCoordinatorDelegate

extension AuthCoordinator: AuthViewModelCoordinatorDelegate {
   
    func openMainInterface() {
        delegate?.openMainInterface(from: self)
    }

}
