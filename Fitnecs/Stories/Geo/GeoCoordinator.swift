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
        geoViewController.tabBarItem = UITabBarItem(title: "Геопозиция", image: Assets.Images.geoTab.image, selectedImage: Assets.Images.geoTab.image)
        let viewModel = GeoViewModel()
        viewModel.coordinatorDelegate = self
        geoViewController.viewModel = viewModel
        return geoViewController
    }()

    weak var delegate: GeoCoordinatorDelegate?
    
    override init() {
       
    }
    
    func start(_ tabController: UITabBarController) {
        var controllers = tabController.viewControllers
        controllers?.append(geoViewController)
        tabController.viewControllers = controllers
    }
    
}

extension GeoCoordinator: GeoViewModelCoordinatorDelegate {
   
    
}

