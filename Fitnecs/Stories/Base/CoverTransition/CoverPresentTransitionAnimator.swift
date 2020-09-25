//
//  CoverPresentTransitionAnimator.swift
//  CustomPresentation
//
//  Created by Alex Habrusevich on 6/23/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import UIKit

class CoverPresentTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
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

        guard let toVc = transitionContext.viewController(forKey: .to),
            let context = toVc as? CoverTransitionContext,
            let toView = transitionContext.view(forKey: .to) else {
            fatalError("Invalid transitionContext")
        }

        toView.frame = container.bounds
        toView.layoutIfNeeded()
        container.addSubview(toView)

        let contentOrigin = context.coverView.frame.minY
        context.dimmingView.alpha = 0
        context.coverView.frame.origin.y = container.bounds.maxY

        let duration = transitionDuration(using: transitionContext)
        let timingParameters = UICubicTimingParameters(animationCurve: .easeInOut)

        let animator = UIViewPropertyAnimator(duration: duration, timingParameters: timingParameters)
        animator.addAnimations {
            context.dimmingView.alpha = 1
            context.coverView.frame.origin.y = contentOrigin
        }
        animator.addCompletion { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            self.propertyAnimator = nil
        }
        propertyAnimator = animator
        return animator
    }
}
