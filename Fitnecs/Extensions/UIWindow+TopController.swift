//
//  UIWindow+TopController.swift
//  VTBMobile
//
//  Created by Panov Sergey on 8/20/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit

extension UIApplication {
    var mostlyTopViewController: UIViewController? {
        return keyWindow?.mostlyTopViewController
    }
}

extension UIWindow {
    var mostlyTopViewController: UIViewController? {
        return rootViewController?.mostlyTopViewController
    }
}

extension UIViewController {
    var mostlyTopViewController: UIViewController {
        if let controller = self as? UINavigationController {
            return controller.visibleViewController?.mostlyTopViewController ?? controller
        }
        if let controller = self as? UISplitViewController {
            return controller.viewControllers.last?.mostlyTopViewController ?? controller
        }
        if let controller = self as? UITabBarController {
            return controller.selectedViewController?.mostlyTopViewController ?? controller
        }
        if let controller = presentedViewController {
            return controller.mostlyTopViewController
        }
        return self
    }
}
