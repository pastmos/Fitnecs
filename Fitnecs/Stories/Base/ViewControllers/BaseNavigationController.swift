//
//  BaseNavigationController.swift
//  VTBMobile
//
//  Created by Aliaksandr Habrusevich on 10/30/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override var prefersStatusBarHidden: Bool {
        return topViewController?.prefersStatusBarHidden ?? false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
