//
//  ActivityViewController.swift
//  Fitnecs
//
//  Created by Past on 27.09.2020.
//

import UIKit


// MARK: - ActivityViewController

class ActivityViewController: UIViewController {

    // MARK: Properties

    var viewModel: ActivityViewModelProtocol?


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewModel?.start()


    }

 

}
