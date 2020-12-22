//
//  CoverDismissTransitionAnimator.swift
//  CustomPresentation
//
//  Created by Panov Sergey on 6/23/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit

class CoverDismissTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    init(duration: TimeInterval) {
        self.duration = duration
    }

    private let duration: TimeInterval
    private var propertyAnimator: UIViewPropertyAnimator?

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let animator = interruptibleAnimator(using: transitionContext)
        animator.startAnimation()
    }

    func transitionDuration(using _: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        if let propertyAnimator = propertyAnimator {
            return propertyAnimator
        }

        let container = transitionContext.containerView

        guard let fromVC = transitionContext.viewController(forKey: .from),
            let context = fromVC as? CoverTransitionContext else {
                fatalError("Invalid transitionContext")
        }

        let duration = transitionDuration(using: transitionContext)
        let timingParameters = UICubicTimingParameters(animationCurve: .easeInOut)

        let animator = UIViewPropertyAnimator(duration: duration, timingParameters: timingParameters)
        animator.addAnimations {
            context.dimmingView.alpha = 0
            context.coverView.frame.origin.y = container.bounds.maxY
        }
        animator.addCompletion { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            self.propertyAnimator = nil
        }
        propertyAnimator = animator
        return animator
    }
}
