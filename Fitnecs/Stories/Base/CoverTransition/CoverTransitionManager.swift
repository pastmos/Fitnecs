//
//  CoverTransitionManager.swift
//  CustomPresentation
//
//  Created by Alex Habrusevich on 6/23/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import UIKit

protocol CoverTransitionContext: AnyObject {
    var dimmingView: UIView { get }
    var coverView: UIView { get }
    var dismissHeaderView: UIView { get }
}

class CoverTransitionManager: NSObject {
    private let interactor = CoverTransitionInteractor()
    private let duration: TimeInterval

    init(duration: TimeInterval = 0.3) {
        self.duration = duration
        super.init()
    }

    func prepare(_ controller: UIViewController) {
        controller.modalPresentationStyle = .overFullScreen
        controller.transitioningDelegate = self
    }

    func present(_ controller: UIViewController, from presenting: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        prepare(controller)
        presenting.present(controller, animated: animated, completion: completion)
    }
}

extension CoverTransitionManager: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting _: UIViewController, source _: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if let presented = presented as? (UIViewController & CoverTransitionContext) {
            interactor.prepare(controller: presented)
            return CoverPresentTransitionAnimator(duration: duration)
        }
        return nil
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if dismissed is CoverTransitionContext {
            return CoverDismissTransitionAnimator(duration: duration)
        }
        return nil
    }

    func interactionControllerForDismissal(using _: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.transitionInProgress ? interactor : nil
    }

    func interactionControllerForPresentation(using _: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
}
