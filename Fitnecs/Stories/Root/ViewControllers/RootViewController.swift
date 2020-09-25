//
//  RootViewController.swift
//  VTBMobile
//
//  Created by Evgeniy Mikholap on 5/30/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import UIKit


class RootViewController: UIViewController {

    // MARK: Properties

    var viewModel: RootViewModelProtocol?


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        forceLightMode()
        viewModel?.start()
    }

    override var prefersStatusBarHidden: Bool {
        return children.last?.prefersStatusBarHidden ?? false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return children.last?.preferredStatusBarStyle ?? .default
    }
}
