//
//  Main.swift
//  VTBMobile
//
//  Created by Evgeniy Mikholap on 6/10/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import UIKit
import SafariServices


// MARK: - MainCoordinatorDelegate

protocol MainCoordinatorDelegate: AnyObject {

    func didFinish(from coordinator: MainCoordinator)
    func openAuthInterface(from coordinator: Coordinator, with screen: AuthCoordinator.Screen, phone: String)
}


// MARK: - Coordinator

class MainCoordinator: Coordinator {

    // MARK: Properties

    weak var delegate: MainCoordinatorDelegate?

    private let rootViewController: RootViewController
    private lazy var mainViewController: MainViewController = {
        let mainViewController = Storyboards.Main.mainViewController.instantiate()


        let viewModel = MainViewModel()
        viewModel.coordinatorDelegate = self

        mainViewController.viewModel = viewModel
        return mainViewController
    }()
    private var smallModalViewController: SmallModalViewController?


    // MARK: Initialization

    init(rootViewController: RootViewController) {
        self.rootViewController = rootViewController
    }


    // MARK: Coordinator

    override func start() {

        rootViewController.addChild(mainViewController)
        rootViewController.view.addSubview(mainViewController.view)

        mainViewController.view.snp.makeConstraints({ maker in
            maker.edges.equalToSuperview()
        })
            

        mainViewController.didMove(toParent: rootViewController)
    }

    override func finish() {
        mainViewController.willMove(toParent: nil)
        mainViewController.view.removeFromSuperview()
        mainViewController.removeFromParent()
        rootViewController.dismiss(animated: true, completion: nil)
        delegate?.didFinish(from: self)
    }

}


// MARK: - MainViewModelCoordinatorDelegate

extension MainCoordinator: MainViewModelCoordinatorDelegate {
    
    func openAuthInterface() {
        delegate?.openAuthInterface(from: self, with: .login, phone: "")
    }

   

    func openSmallModal(viewData: SmallModalViewDataType, from controller: UIViewController, dismiss: (() -> Void)?) {
        let smallModalViewController = Storyboards.Common.smallModalViewController.instantiate()
        smallModalViewController.bind(viewData: viewData)

        let contentController = BaseCoverContentViewController(contentController: smallModalViewController,
                                                               mode: .fitContentSize,
                                                               backgroundColor: Assets.Colors.backgroundBlueColor.color)
        contentController.onDeinit = {
            dismiss?()
        }

        controller.present(contentController, animated: true, completion: nil)

        self.smallModalViewController = smallModalViewController
    }

 

    func open(url: URL, from controller: UIViewController) {
        let browserController = SFSafariViewController(url: url)
        controller.present(browserController, animated: true, completion: nil)
    }

 
    func close(from controller: UIViewController, _ completion: (() -> Void)? = nil) {
        if let navigationController = controller.navigationController {
            navigationController.popViewController(animated: true)
        }
        else {
            controller.dismiss(animated: true) {
                completion?()
            }
        }
    }

 

}
