//
//  ActivityCoordinator.swift
//  Fitnecs
//
//  Created by Panov Sergey on 27.09.2020.
//

import UIKit

protocol ActivityCoordinatorDelegate: AnyObject {
    func didFinish(from coordinator: ActivityCoordinator)
}


// MARK: - Coordinator

class ActivityCoordinator: Coordinator {

    // MARK: Properties

    private lazy var activityViewController: ActivityViewController = {
        let activityViewController = Storyboards.Activity.activityViewController.instantiate()
        activityViewController.tabBarItem = UITabBarItem(title: Strings.Tabs.Activity.title, image: Assets.Images.activityInactiveTab.image, selectedImage: Assets.Images.activityTab.image)
        let viewModel = ActivityViewModel()
        viewModel.coordinatorDelegate = self
        activityViewController.viewModel = viewModel
        return activityViewController
    }()

    weak var delegate: ActivityCoordinatorDelegate?

    override init() {

    }

    func start(_ tabController: UITabBarController) {
        tabController.viewControllers = [activityViewController]
    }

    override func finish() {
        delegate?.didFinish(from: self)

    }


}

extension ActivityCoordinator: ActivityViewModelCoordinatorDelegate {

}
