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

    @IBOutlet weak var scrollView: UIScrollView!

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

    @IBOutlet weak var distanceItem: ActivityItem!
    @IBOutlet weak var stepsItem: ActivityItem!
    @IBOutlet weak var caloriesItem: ActivityItem!

    @IBOutlet weak var pointerView: UIView!
    @IBOutlet weak var pointerContainerView: UIView!

    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    // MARK: Properties
    var viewModel: ActivityViewModelProtocol?

    var activityItemsArray: [ActivityItem] = []

    var currentPointerX: CGFloat = 0
    var distanceItemX: CGFloat = 0
    var stepsItemX: CGFloat = 0
    var caloriesItemX: CGFloat = 0

    // MARK: Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.getActivityViewData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.isHidden = true

        activityItemsArray = [distanceItem, stepsItem, caloriesItem]

        scrollView.contentInsetAdjustmentBehavior = .never
        avatarImage.makeRounded()
        topConstraint.constant = UIApplication.hasTopNotch ? 65 : 40

        distanceItem.delegate = self
        stepsItem.delegate = self
        caloriesItem.delegate = self

        viewModel?.updateUser = { [weak self] data in
            guard let self = self else {
                return
            }

            self.activityIndexCircleProgress.setProgress(to: data.activityIndex, maxValue: Const.activityIndexMax, startColor: Assets.Colors.circleGradientStart.color, endColor: Assets.Colors.circleGradientEnd.color, thickness: 32, isFractional: false, type: .activityIndex, yesterdayIndex: 54)

            self.yesterdayActivityIndexCircleProgress.setProgress(to: 54, maxValue: Const.activityIndexMax, startColor: Assets.Colors.circleYesterdayGradientEnd.color, endColor: Assets.Colors.circleYesterdayGradientEnd.color, thickness: 2, isFractional: false, type: .yesterdayIndex, yesterdayIndex: 54)

            self.avatarImage.image = data.avatarImage
            self.pointsLabel.text = String(data.points)
            self.todayStatusLabel.text = data.todayStatus
            self.normalStatusLabel.text = data.normalStatus
            self.motivationLabel.text = data.motivation
        }

        viewModel?.updateActivity = { [weak self] data in
            guard let self = self else {
                return
            }
            self.sleepCircleProgress.setProgress(to: data.sleepHours, maxValue: Const.sleepPerDay, startColor: Assets.Colors.circleGradientStart.color, endColor: Assets.Colors.circleGradientEnd.color, type: .sleep)

            self.stepsItem.bind(viewData: data.stepsItemData)
            self.distanceItem.bind(viewData: data.kilometersItemData)
            self.caloriesItem.bind(viewData: data.caloriesItemData)

            self.scrollView.isHidden = false
        }

        viewModel?.updateChart = { [weak self] data, type in
            guard let self = self else {
                return
            }
            let weekDays = self.getWeekDays()
            self.chartView.animate(yAxisDuration: 1)
            self.chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: weekDays)
            switch type {
            case .steps:
                self.chartView.data = data.stepsChart
            case .calories:
                self.chartView.data = data.caloriesChart
            case .distance:
                self.chartView.data = data.distanceChart
            }
        }


        viewModel?.start()
    }

    override func viewDidLayoutSubviews() {
        distanceItemX = pointerContainerView.convert(distanceItem.center, to: self.view).x
        stepsItemX = pointerContainerView.convert(stepsItem.center, to: self.view).x
        caloriesItemX = pointerContainerView.convert(caloriesItem.center, to: self.view).x
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        yesterdayActivityIndexCircleProgress.removeYesterdayIndexView()
    }


    private func getWeekDays() -> [String] {
        let date = Date()
        return date.lastWeekDaysArray()
    }

    @IBAction func profileDidTap(_ sender: Any) {
        viewModel?.profileDidTap(controller: self)
    }
}

extension ActivityViewController: ActivityItemDelegate {
    func itemDidTap(type: ChartType) {
        activityItemsArray.forEach { item in
            item.setState(false)
        }
        switch type {
        case .steps:
            stepsItem.setState(true)
            UIView.animate(withDuration: 0.7, animations: {
                self.pointerView.center.x = self.stepsItemX
            })
        case .calories:
            caloriesItem.setState(true)
            print(self.pointerView.center.x)
            UIView.animate(withDuration: 0.7, animations: {
                self.pointerView.center.x = self.caloriesItemX
            })
        case .distance:
            distanceItem.setState(true)
            UIView.animate(withDuration: 0.7, animations: {
                self.pointerView.center.x = self.distanceItemX
            })
        }
        viewModel?.activityItemDidTap(type)
    }

}
