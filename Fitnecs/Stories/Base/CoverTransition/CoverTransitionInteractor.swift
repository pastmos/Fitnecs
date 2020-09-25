//
//  CoverTransitionInteractor.swift
//  CustomPresentation
//
//  Created by Alex Habrusevich on 6/23/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import UIKit

class CoverTransitionInteractor: UIPercentDrivenInteractiveTransition {
    private weak var controller: (UIViewController & CoverTransitionContext)?
    private(set) var shouldCompleteTransition = false
    private(set) var transitionInProgress = false

    func prepare(controller: UIViewController & CoverTransitionContext) {
        self.controller = controller
        setupDismissGestures(in: controller)
    }

    private func setupDismissGestures(in context: CoverTransitionContext) {
        context.dimmingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapDismissGesture)))
        context.dismissHeaderView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanDismissGesture(_:))))
//        context.coverView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanDismissGesture(_:))))
    }

    @objc private func handleTapDismissGesture() {
        controller?.dismiss(animated: true, completion: nil)
    }

    @objc private func handlePanDismissGesture(_ gesture: UIPanGestureRecognizer) {
        guard let controller = controller,
            let view = gesture.view else {
                return
        }

        let viewTranslation = gesture.translation(in: view)
        var progress = viewTranslation.y / controller.coverView.bounds.height
        progress = min(max(progress, 0.0), 1.0)

        switch gesture.state {
        case .began:
            transitionInProgress = true
            controller.view.endEditing(true)
            controller.dismiss(animated: true, completion: nil)
        case .changed:
            let velocity = gesture.velocity(in: view)
            if velocity.y == 0 {
                shouldCompleteTransition = progress >= 0.47
            }
            else if velocity.y > 0 {
                shouldCompleteTransition = progress > 0.3
            }
            else {
                shouldCompleteTransition = progress > 0.7
            }

            update(progress)
        case .cancelled:
            transitionInProgress = false
            cancel()
        case .ended:
            transitionInProgress = false
            shouldCompleteTransition ? finish() : cancel()
        default:
            return
        }
    }
}
