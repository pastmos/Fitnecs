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

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var stepsTodayLabel: UILabel!
    @IBOutlet weak var weekStepsChart: BarChartView!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        weekStepsChart.animate(yAxisDuration: 2.0)
        weekStepsChart.pinchZoomEnabled = false
        weekStepsChart.drawBarShadowEnabled = false
        weekStepsChart.drawBordersEnabled = false
        weekStepsChart.doubleTapToZoomEnabled = false
        weekStepsChart.drawGridBackgroundEnabled = true


        viewModel?.updateScreen = { [weak self] data in
            self?.weekStepsChart.data = data.chartData
            self?.stepsTodayLabel.text = data.stepsToday
        }

        viewModel?.start()


    }

 

}
