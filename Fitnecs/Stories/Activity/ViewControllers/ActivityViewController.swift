//
//  ActivityViewController.swift
//  Fitnecs
//
//  Created by Panov Sergey on 27.09.2020.
//

import UIKit
import Charts


// MARK: - ActivityViewController

class ActivityViewController: UIViewController {

    @IBOutlet weak var activityIndexCircleProgress: CircularProgressBar!
    // MARK: Properties

    var viewModel: ActivityViewModelProtocol?


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndexCircleProgress.setProgress(to: 740, maxValue: 1000, lineColor: Assets.Colors.redProgress.color, withAnimation: true)

        viewModel?.updateScreen = { [weak self] data in

        }

        viewModel?.start()
    }


}
