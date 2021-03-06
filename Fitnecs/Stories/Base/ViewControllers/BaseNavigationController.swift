//
//  BaseNavigationController.swift
//  VTBMobile
//
//  Created by Panov Sergey on 10/30/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
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
