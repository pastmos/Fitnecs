//
//  RoundedView.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 6/15/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit

class RoundedView: UIView {
    var radius: CGFloat = 12

    var corners: UIRectCorner = [.topLeft, .topRight] {
        didSet {
            roundCorners(corners, radius: radius)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners, radius: radius)
    }
}

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
