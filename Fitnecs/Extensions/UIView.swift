//
//  UIView.swift
//  Fitnecs
//
//  Created by Panov Sergey on 14.12.2020.
//  Copyright © 2020 Sergey Panov. All rights reserved.
//

import UIKit

extension UIView {

    func makeCircle() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) * 0.5
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }

    func setX(x: CGFloat) {
        var frame: CGRect = self.frame
        frame.origin.x = x
        self.frame = frame
    }

    func setY(y: CGFloat) {
        var frame: CGRect = self.frame
        frame.origin.y = y
        self.frame = frame
    }
}
