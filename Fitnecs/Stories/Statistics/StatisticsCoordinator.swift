//
//  StatisticsCoordinator.swift
//  Fitnecs
//
//  Created by Panov Sergey on 16.10.2020.
//

import UIKit

protocol StatisticsCoordinatorDelegate: AnyObject {
    func didFinish(from coordinator: StatisticsCoordinator)
}


// MARK: - Coordinator

class StatisticsCoordinator: Coordinator {

    // MARK: Properties

    private lazy var statisticsViewController: StatisticsViewController = {
        let statisticsViewController = Storyboards.Statistics.statisticsViewController.instantiate()
        statisticsViewController.tabBarItem = UITabBarItem(title: Strings.Tabs.Statistics.title, image: Assets.Images.statisticsTab.image, selectedImage: Assets.Images.statisticsTab.image)
        let viewModel = StatisticsViewModel()
        viewModel.coordinatorDelegate = self
        statisticsViewController.viewModel = viewModel
        return statisticsViewController
    }()

    weak var delegate: StatisticsCoordinatorDelegate?

    override init() {

    }

    func start(_ tabController: UITabBarController) {
        var controllers = tabController.viewControllers
        controllers?.append(statisticsViewController)
        tabController.viewControllers = controllers
    }

}

extension StatisticsCoordinator: StatisticsViewModelCoordinatorDelegate {


}
