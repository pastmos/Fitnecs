//
//  InteractivePopRecognizer.swift
//  VTBMobile
//
//  Created by Evgeniy Mikholap on 6/6/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import UIKit


// MARK: - InteractivePopRecognizer

class InteractivePopRecognizer: NSObject {

    // MARK: Properties

    weak var navigationController: UINavigationController?


    // MARK: Initializers

    init(controller: UINavigationController) {
        self.navigationController = controller
    }

}


// MARK: - UIGestureRecognizerDelegate

extension InteractivePopRecognizer: UIGestureRecognizerDelegate {

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return navigationController?.viewControllers.count ?? 0 > 1
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

}
