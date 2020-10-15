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

    // MARK: Properties

    var viewModel: ActivityViewModelProtocol?

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var stepsTodayLabel: UILabel!
    @IBOutlet weak var weekStepsChart: BarChartView!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        avatarImageView.makeRounded()
        setupChart()

        viewModel?.updateScreen = { [weak self] data in
            let weekDays = self?.viewModel?.getWeekDays() ?? []
            self?.weekStepsChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: weekDays)
            self?.weekStepsChart.data = data.distanceWalkChartData
            self?.stepsTodayLabel.text = data.stepsToday
            self?.weightLabel.text = data.weight
            self?.heightLabel.text = data.height
        }

        viewModel?.start()
    }

    private func setupChart() {
        weekStepsChart.animate(yAxisDuration: 2.0)
        weekStepsChart.pinchZoomEnabled = false
        weekStepsChart.drawBarShadowEnabled = false
        weekStepsChart.drawBordersEnabled = false
        weekStepsChart.doubleTapToZoomEnabled = false
        weekStepsChart.drawGridBackgroundEnabled = true
    }

}
