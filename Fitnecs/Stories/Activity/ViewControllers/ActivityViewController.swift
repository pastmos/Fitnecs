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
    @IBOutlet weak var stepsCircleProgress: CircularProgressBar!
    @IBOutlet weak var sleepCircleProgress: CircularProgressBar!
    @IBOutlet weak var distanceCircleProgress: CircularProgressBar!

    @IBOutlet weak var activityLabel: UILabel! {
        didSet {
            activityLabel.text = Strings.Activity.Index.label
        }
    }
    @IBOutlet weak var stepsLabel: UILabel! {
        didSet {
            stepsLabel.text = Strings.Activity.Steps.label
        }
    }
    @IBOutlet weak var sleepLabel: UILabel! {
        didSet {
            sleepLabel.text = Strings.Activity.Sleep.label
        }
    }
    @IBOutlet weak var distanceLabel: UILabel! {
        didSet {
            distanceLabel.text = Strings.Activity.Distance.label
        }
    }
    @IBOutlet weak var pointsCaptionLabel: UILabel! {
        didSet {
            pointsCaptionLabel.text = Strings.Activity.Points.Caption.label
        }
    }
    @IBOutlet weak var pointsView: UIView!
    @IBOutlet weak var pointsLabel: UILabel!

    // MARK: Properties

    var viewModel: ActivityViewModelProtocol?


    // MARK: Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        viewModel?.start()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.updateScreen = { [weak self] data in
            self?.activityIndexCircleProgress.setProgress(to: data.activityIndex, maxValue: Const.activityIndexDay, lineColor: Assets.Colors.redProgress.color, thickness: 10)

            self?.stepsCircleProgress.setProgress(to: data.steps, maxValue: Const.stepsPerDay, lineColor: Assets.Colors.lightblueProgress.color, isFractional: false)

            self?.sleepCircleProgress.setProgress(to: data.sleep, maxValue: Const.sleepPerDay, lineColor: Assets.Colors.blueProgress.color)

            self?.distanceCircleProgress.setProgress(to: data.distance, maxValue: Const.distancePerDay, lineColor: Assets.Colors.purpleProgress.color)

            self?.pointsLabel.text = data.activityPoints
        }

        pointsView.layer.cornerRadius = 12
        pointsView.layer.borderWidth = 2
        pointsView.layer.borderColor = Assets.Colors.darkBlue.color.cgColor

        viewModel?.start()
    }


}
