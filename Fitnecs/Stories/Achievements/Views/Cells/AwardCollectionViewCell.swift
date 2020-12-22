//
//  AwardCollectionViewCell.swift
//  Fitnecs
//
//  Created by Panov Sergey on 20.10.2020.
//

import UIKit
import Reusable

class AwardCollectionViewCell: UICollectionViewCell, Reusable {

    @IBOutlet weak var awardImage: UIImageView!

    @IBOutlet weak var textLabel: UILabel!

    func configure(with model: AwardModel) {

        awardImage.image = (model.isActivated ?? false) ? Assets.Images.awardActive.image : Assets.Images.awardInactive.image

        textLabel.text = String(describing: model.text ?? "")
        textLabel.textColor = (model.isActivated ?? false) ? Assets.Colors.textDark.color : Assets.Colors.textGrey.color
    }

}
