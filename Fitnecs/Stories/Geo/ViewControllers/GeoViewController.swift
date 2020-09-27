//
//  GeoViewController.swift
//  Fitnecs
//
//  Created by Past on 27.09.2020.
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
