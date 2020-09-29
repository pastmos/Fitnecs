//
//  GeoViewController.swift
//  Fitnecs
//
//  Created by Panov Sergey on 28.09.2020.
//

import UIKit


// MARK: - GeoViewController

class GeoViewController: UIViewController {

    // MARK: Properties

    var viewModel: GeoViewModelProtocol?


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()


        viewModel?.start()


    }



}
