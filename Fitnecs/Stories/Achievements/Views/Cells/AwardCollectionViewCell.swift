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
    @IBOutlet weak var numberLabel: UILabel!

    func configure(with model: AwardModel) {

        awardImage.image = (model.isActivated ?? false) ? Assets.Images.userAvatar.image : Assets.Images.userAvatar.image

        numberLabel.text = (model.isActivated ?? false) ? String(describing: model.number ?? 0) : ""
    }

}
