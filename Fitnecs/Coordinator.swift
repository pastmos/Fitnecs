//
//  Coordinator.swift
//  VTBMobile
//
//  Created by Panov Sergey on 5/30/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit

protocol ViewModelCoordinatorDelegate: AnyObject {
    func showInfoAlert(with viewData: AlertViewDataType, from controller: UIViewController)
    func showInfoAlert(with viewData: AlertViewDataType)
    func showErrorInfoAlert(from controller: UIViewController)
    func close(from controller: UIViewController)
}

class Coordinator {

    deinit {
        removeAllChildCoordinators()
    }

    private(set) var childCoordinators: [Coordinator] = []

    func start() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }

    func finish() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }

    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(of: coordinator) {
            childCoordinators.remove(at: index)
        }
        else {
            print("Couldn't remove coordinator: \(coordinator). It's not a child coordinator.")
        }
    }

    func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        childCoordinators = childCoordinators.filter {
            $0 is T == false
        }
    }

    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }

    func close(from controller: UIViewController) {
        if let navigationController = controller.navigationController {
            navigationController.popViewController(animated: true)
        }
        else {
            controller.dismiss(animated: true, completion: nil)
        }
    }

    func showInfoAlert(with viewData: AlertViewDataType, from controller: UIViewController) {
        controller.showInfoAlert(with: viewData)
    }

    func showErrorInfoAlert(from controller: UIViewController) {
        controller.showErrorInfoAlert()
    }

    func showInfoAlert(with viewData: AlertViewDataType) {
        if let controller = UIApplication.shared.mostlyTopViewController {
            showInfoAlert(with: viewData, from: controller)
        }
    }

//    func showAppReviewAlert() {
//        let alertController = AppReviewPopupController(nibName: nil, bundle: nil)
//        UIApplication.shared.mostlyTopViewController?.present(alertController, animated: true, completion: nil)
//    }
}

extension Coordinator: Equatable {

    static func == (lhs: Coordinator, rhs: Coordinator) -> Bool {
        return lhs === rhs
    }

}

extension UIViewController {

    func showInfoAlert(with viewData: AlertViewDataType) {
        let firstAction = AlertAction(title: viewData.closeButtonTitle) { _ in
            viewData.close?()
        }
        var secondAction: AlertAction? = nil

        if let actionButtonTitle = viewData.actionButtonTitle {
            secondAction = AlertAction(title: actionButtonTitle) { _ in
                viewData.action?()
            }
        }

        let alert = AlertViewController(title: viewData.title, message: viewData.text, firstAction: firstAction, secondAction: secondAction)
        present(alert, animated: true, completion: nil)
    }

    func showErrorInfoAlert() {
        let errorAlertViewData = AlertViewData(title: Strings.Common.Error.Alert.title,
                                               text: Strings.Common.Error.Alert.text,
                                               closeButtonTitle: Strings.Common.Button.Ok.title)
        showInfoAlert(with: errorAlertViewData)
    }

    func openInfo(viewData: InfoViewDataType) {
        let alertController = Storyboards.Common.infoViewController.instantiate()
        alertController.bind(viewData: viewData)

        let contentController = PopupContentViewController(contentController: alertController)

        present(contentController, animated: true, completion: nil)
    }
}
