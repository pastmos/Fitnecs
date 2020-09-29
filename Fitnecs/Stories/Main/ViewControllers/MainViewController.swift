//
//  MainViewController.swift
//  VTBMobile
//
//  Created by Panov Sergey on 6/10/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
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
