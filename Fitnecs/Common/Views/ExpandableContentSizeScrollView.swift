//
//  ExpandableContentSizeScrollView.swift
//  Fitnecs
//
//  Created by Panov Sergey on 21.10.2020.
//

import UIKit

class ExpandableContentSizeScrollView: UIScrollView {

    private var oldContentSize: CGSize = .zero

    override var contentOffset: CGPoint {

        set {
            if oldContentSize == contentSize {
                super.contentOffset = newValue
            } else {
                oldContentSize = contentSize
            }
        }

        get {
            return super.contentOffset
        }
    }
}
