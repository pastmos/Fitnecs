//
//  AchievementsCard.swift
//  Fitnecs
//
//  Created by Panov Sergey on 21.12.2020.
//  Copyright © 2020 Sergey Panov. All rights reserved.
//

import UIKit

class AchievementsCard: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var imageView: UIImageView!

    var viewData: AchievementCard?

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func bind(viewData: AchievementCard) {
        titleLabel.text = viewData.title
        descriptionLabel.text = viewData.description
        imageView.image = viewData.image

        self.viewData = viewData
    }
}
