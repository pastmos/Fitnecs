//
//  StatisticsViewController.swift
//  Fitnecs
//
//  Created by Panov Sergey on 16.10.2020.
//

import UIKit
import Charts


// MARK: - ActivityViewController

class StatisticsViewController: UIViewController {


    // MARK: Properties

    var viewModel: StatisticsViewModelProtocol?


    // MARK: Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        viewModel?.start()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.updateScreen = { [weak self] data in

        }


        viewModel?.start()
    }


}