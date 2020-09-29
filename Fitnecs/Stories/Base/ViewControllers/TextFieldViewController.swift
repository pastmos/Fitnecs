//
//  TextFieldViewController.swift
//  VTBMobile
//
//  Created by Panov Sergey on 6/18/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit


// MARK: - TextFieldViewController

class TextFieldViewController: BaseViewController {

    // MARK: Properties

    @IBOutlet private var buttonContainerViewTopLayoutConstraint: NSLayoutConstraint!
    @IBOutlet private var buttonContainerViewBottomLayoutConstraint: NSLayoutConstraint!

    private enum Contants {

        static let buttonBottomPaddingFromSafeArea: CGFloat = 69
        static let buttonBottomPaddingFromKeyboard: CGFloat = 22

    }


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowOrHide), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowOrHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}


// MARK: - Keyboard Handling

extension TextFieldViewController {

    @objc func keyboardWillShowOrHide(notification: Notification) {
        let willShow = notification.name == UIResponder.keyboardWillShowNotification
        let duration: TimeInterval = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval) ?? 0.25
        let curve: UInt = (notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt) ?? 7

        view.layoutIfNeeded()

        UIView.animate(withDuration: duration, delay: 0, options: UIView.AnimationOptions(rawValue: curve), animations: {
            if let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                self.buttonContainerViewBottomLayoutConstraint.constant = willShow ? keyboardSize.height - self.view.safeAreaInsets.bottom + Contants.buttonBottomPaddingFromKeyboard : Contants.buttonBottomPaddingFromSafeArea
            }
            else {
                self.buttonContainerViewBottomLayoutConstraint.isActive = !willShow
                self.buttonContainerViewTopLayoutConstraint.isActive = willShow
            }

            self.view.layoutIfNeeded()
        }, completion: nil)
    }

}
