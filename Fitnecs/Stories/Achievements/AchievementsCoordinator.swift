//
//  AchievementsCoordinator.swift
//  Fitnecs
//
//  Created by Panov Sergey on 20.10.2020.
//

import UIKit

protocol AchievementsCoordinatorDelegate: AnyObject {
    func didFinish(from coordinator: AchievementsCoordinator)
}


// MARK: - Coordinator

class AchievementsCoordinator: Coordinator {

    // MARK: Properties

    private lazy var achievementsViewController: AchievementsViewController = {
        let achievementsViewController = Storyboards.Achievements.achievementsViewController.instantiate()
        achievementsViewController.tabBarItem = UITabBarItem(title: Strings.Tabs.Achievements.title, image: Assets.Images.achievementInactiveTab.image, selectedImage: Assets.Images.achievementTab.image)
        let viewModel = AchievementsViewModel()
        viewModel.coordinatorDelegate = self
        achievementsViewController.viewModel = viewModel
        return achievementsViewController
    }()

    weak var delegate: AchievementsCoordinatorDelegate?

    override init() {

    }

    func start(_ tabController: UITabBarController) {
        let achievementsNavigationController = BaseNavigationController(rootViewController: achievementsViewController)
        achievementsNavigationController.navigationBar.isHidden = true

        var controllers = tabController.viewControllers
        controllers?.append(achievementsNavigationController)
        tabController.viewControllers = controllers
    }

    override func finish() {
        delegate?.didFinish(from: self)
    }


}

extension AchievementsCoordinator: AchievementsViewModelCoordinatorDelegate {

}
