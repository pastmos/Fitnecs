//
//  ActivityItem.swift
//  Fitnecs
//
//  Created by Panov Sergey on 15.12.2020.
//  Copyright © 2020 Sergey Panov. All rights reserved.
//

import UIKit
import SnapKit


protocol ActivityItemDelegate: class {
    func itemDidTap(type: ChartType)
}

class ActivityItem: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var pointView: UIView!
    @IBOutlet weak var tickImageView: UIImageView!

    var viewData: ActivityItemViewData!

    weak var delegate: ActivityItemDelegate?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("\(ActivityItem.self)", owner: self, options: nil)
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false

        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        pointView.makeCircle()
    }

    func bind(viewData: ActivityItemViewData) {
        amountLabel.text = viewData.amount

        var image = UIImage()
        switch viewData.type {

        case .steps:
            image = Assets.Images.stepsIcon.image
            unitLabel.text = Strings.Activity.Steps.Unit.label
        case .calories:
            image = Assets.Images.caloriesIcon.image
            unitLabel.text = Strings.Activity.Calories.Unit.label
        case .distance:
            image = Assets.Images.distanceIcon.image
            unitLabel.text = Strings.Activity.Distance.Unit.label
        case .none:
            print("")
        }

        imageView.image = image

        self.viewData = viewData
        setState(viewData.isActive ?? false)
    }


    func setState(_ isSelected: Bool) {
        pointView.backgroundColor = isSelected ?  Assets.Colors.blueText.color : Assets.Colors.greyPoint.color
        tickImageView.isHidden = isSelected ? false : true
        self.viewData.isActive = isSelected
    }

    @IBAction func itemDidTap(_ sender: Any) {
        guard let type = viewData.type else {
            return
        }
        delegate?.itemDidTap(type: type)
    }

}
