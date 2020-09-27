//
//  MainViewController.swift
//  VTBMobile
//
//  Created by Evgeniy Mikholap on 6/10/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import UIKit


// MARK: - MainViewController

class MainViewController: UITabBarController {

    // MARK: Properties

    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    var viewModel: MainViewModelProtocol?


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewModel?.start(from: self)


    }

 

}
