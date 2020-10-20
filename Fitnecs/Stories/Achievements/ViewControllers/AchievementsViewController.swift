//
//  AchievementsViewController.swift
//  Fitnecs
//
//  Created by Panov Sergey on 20.10.2020.
//

import UIKit


// MARK: - ActivityViewController

class AchievementsViewController: UIViewController {


    // MARK: Properties

    var viewModel: AchievementsViewModelProtocol?


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
