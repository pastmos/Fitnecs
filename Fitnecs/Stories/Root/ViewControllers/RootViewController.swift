//
//  RootViewController.swift
//  VTBMobile
//
//  Created by Panov Sergey on 5/30/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit


class RootViewController: UIViewController {

    // MARK: Properties

    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!

    var viewModel: RootViewModelProtocol?


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        forceLightMode()

        viewModel?.updateState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .normal:
                    self?.activitiIndicator.stopAnimating()
                case .loading:
                    self?.activitiIndicator.startAnimating()
                case .error(let viewData):
                  return
                }
            }
        }

        viewModel?.start()
    }

    override var prefersStatusBarHidden: Bool {
        return children.last?.prefersStatusBarHidden ?? false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return children.last?.preferredStatusBarStyle ?? .default
    }
}
