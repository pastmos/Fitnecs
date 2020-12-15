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

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var pointsLabel: UILabel!
    // MARK: Properties

    var viewModel: ActivityViewModelProtocol?


    // MARK: Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.getActivityViewData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.updateScreen = { [weak self] data in
            guard let self = self else {
                return
            }
//            self.activityIndexCircleProgress.setProgress(to: data.activityIndex, maxValue: Const.activityIndexMax, startColor: Assets.Colors.circleGradientStart.color, endColor: Assets.Colors.circleGradientEnd.color, thickness: 40)
//
//            self.sleepCircleProgress.setProgress(to: data.sleep, maxValue: Const.sleepPerDay, startColor: Assets.Colors.circleGradientStart.color, endColor: Assets.Colors.circleGradientEnd.color)


            self.activityIndexCircleProgress.setProgress(to: 72, maxValue: Const.activityIndexMax, startColor: Assets.Colors.circleGradientStart.color, endColor: Assets.Colors.circleGradientEnd.color, thickness: 32, isFractional: false, type: .activityIndex, yesterdayIndex: 100)

            self.sleepCircleProgress.setProgress(to: 5, maxValue: Const.sleepPerDay, startColor: Assets.Colors.circleGradientStart.color, endColor: Assets.Colors.circleGradientEnd.color, type: .sleep)

            self.yesterdayActivityIndexCircleProgress.setProgress(to: 54, maxValue: Const.activityIndexMax, startColor: Assets.Colors.circleYesterdayGradientEnd.color, endColor: Assets.Colors.circleYesterdayGradientEnd.color, thickness: 2, isFractional: false, type: .yesterdayIndex, yesterdayIndex: 54)


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
