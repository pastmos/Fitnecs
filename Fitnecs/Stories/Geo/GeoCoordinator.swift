//
//  GeoCoordinator.swift
//  Fitnecs
//
//  Created by Panov Sergey on 27.09.2020.
//

import UIKit

protocol GeoCoordinatorDelegate: AnyObject {
    func didFinish(from coordinator: GeoCoordinator)
}


// MARK: - Coordinator

class GeoCoordinator: Coordinator {

    // MARK: Properties

    private lazy var geoViewController: GeoViewController = {
        let geoViewController = Storyboards.Geo.geoViewController.instantiate()
        geoViewController.tabBarItem = UITabBarItem(title: Strings.Tabs.Geo.title, image: Assets.Images.geoInactiveTab.image, selectedImage: Assets.Images.geoTab.image)
        let viewModel = GeoViewModel()
        viewModel.coordinatorDelegate = self
        geoViewController.viewModel = viewModel
        return geoViewController
    }()

    weak var delegate: GeoCoordinatorDelegate?

    override init() {

    }

    func start(_ tabController: UITabBarController) {
        let geoNavigationController = BaseNavigationController(rootViewController: geoViewController)
        geoNavigationController.navigationBar.isHidden = true

        var controllers = tabController.viewControllers
        controllers?.append(geoNavigationController)
        tabController.viewControllers = controllers
    }

}

extension GeoCoordinator: GeoViewModelCoordinatorDelegate {


}

