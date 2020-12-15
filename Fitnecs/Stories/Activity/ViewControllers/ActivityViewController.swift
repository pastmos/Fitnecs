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
    @IBOutlet weak var yesterdayActivityIndexCircleProgress: CircularProgressBar!
    @IBOutlet weak var sleepCircleProgress: CircularProgressBar!

    @IBOutlet weak var sleepLabel: UILabel! {
        didSet {
            sleepLabel.text = Strings.Activity.Sleep.label
        }
    }

    @IBOutlet weak var todayStatusLabel: UILabel!
    @IBOutlet weak var normalStatusLabel: UILabel!
    @IBOutlet weak var motivationLabel: UILabel!

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var pointsLabel: UILabel!

    @IBOutlet weak var chartView: BarChartView!

    // MARK: Properties
    var viewModel: ActivityViewModelProtocol?


    // MARK: Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.getActivityViewData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.avatarImage.makeRounded()

        viewModel?.updateUser = { [weak self] data in
            guard let self = self else {
                return
            }

            self.activityIndexCircleProgress.setProgress(to: data.activityIndex, maxValue: Const.activityIndexMax, startColor: Assets.Colors.circleGradientStart.color, endColor: Assets.Colors.circleGradientEnd.color, thickness: 32, isFractional: false, type: .activityIndex, yesterdayIndex: 100)

            self.yesterdayActivityIndexCircleProgress.setProgress(to: 54, maxValue: Const.activityIndexMax, startColor: Assets.Colors.circleYesterdayGradientEnd.color, endColor: Assets.Colors.circleYesterdayGradientEnd.color, thickness: 2, isFractional: false, type: .yesterdayIndex, yesterdayIndex: 54)

            self.avatarImage.image = data.avatarImage
        }

        viewModel?.updateActivity = { [weak self] data in
            guard let self = self else {
                return
            }
            self.sleepCircleProgress.setProgress(to: data.sleepHours, maxValue: Const.sleepPerDay, startColor: Assets.Colors.circleGradientStart.color, endColor: Assets.Colors.circleGradientEnd.color, type: .sleep)


        }

        viewModel?.updateChart = { [weak self] data in
            guard let self = self else {
                return
            }
            let weekDays = self.viewModel?.getWeekDays() ?? []
            self.chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: weekDays)
            self.chartView.data = data.stepsChart

        }


        viewModel?.start()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        yesterdayActivityIndexCircleProgress.removeYesterdayIndexView()
    }

}


extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
