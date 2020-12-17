//
//  ProfileCoordinator.swift
//  Fitnecs
//
//  Created by Panov Sergey on 20.10.2020.
//

import UIKit

protocol ProfileCoordinatorDelegate: AnyObject {
    func didFinish(from coordinator: ProfileCoordinator)
}


// MARK: - Coordinator

class ProfileCoordinator: Coordinator {

    // MARK: Properties

    private lazy var profileViewController: ProfileViewController = {
        let profileViewController = Storyboards.Profile.profileViewController.instantiate()
        profileViewController.tabBarItem = UITabBarItem(title: Strings.Tabs.Profile.title, image: Assets.Images.profileTab.image, selectedImage: Assets.Images.profileTab.image)
        let viewModel = ProfileViewModel()
        viewModel.coordinatorDelegate = self
        profileViewController.viewModel = viewModel
        return profileViewController
    }()

    weak var delegate: ProfileCoordinatorDelegate?

    var baseViewController: UIViewController?

    init(controller: UIViewController) {
        baseViewController = controller
    }

    override func start() {
        baseViewController?.navigationController?.pushViewController(profileViewController, animated: true)
    }

    override func finish() {
        delegate?.didFinish(from: self)
    }
}

extension ProfileCoordinator: ProfileViewModelCoordinatorDelegate {

    func openAuth() {
        self.finish()
    }

}
