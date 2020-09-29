//
//  ActivityCoordinator.swift
//  Fitnecs
//
//  Created by Past on 27.09.2020.
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
        activityViewController.tabBarItem = UITabBarItem(title: "Активность", image: Assets.Images.activityTab.image, selectedImage: Assets.Images.activityTab.image)
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
    
}

extension ActivityCoordinator: ActivityViewModelCoordinatorDelegate {
   
    
}
