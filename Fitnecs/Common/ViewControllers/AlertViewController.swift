//
//  AlertViewController.swift
//  VTBMobile
//
//  Created by Evgeniy Mikholap on 7/29/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import UIKit

import DynamicBlurView


final class AlertViewController: UIViewController {

    // MARK: Properties

    @IBOutlet private var alertView: UIView! {
        didSet {
            alertView.layer.cornerRadius = 14
            alertView.layer.masksToBounds = true
            alertView.alpha = 0
        }
    }
    @IBOutlet private var infoContainerView: UIView! {
        didSet {
            infoContainerView.isHidden = title == nil && message == nil
        }
    }
    @IBOutlet private var buttonsStackView: UIStackView!
    @IBOutlet private var titleLabel: UILabel! {
        didSet {
            configure(label: titleLabel, with: title)
        }
    }
    @IBOutlet private var messageLabel: UILabel! {
        didSet {
            configure(label: messageLabel, with: message)
        }
    }
    @IBOutlet private var firstButton: UIButton! {
        didSet {
            configure(button: firstButton, with: firstAction)
        }
    }
    @IBOutlet private var secondButton: UIButton! {
        didSet {
            configure(button: secondButton, with: secondAction)
        }
    }
    @IBOutlet private var verticalSeparatorView: UIView! {
        didSet {
            verticalSeparatorView.isHidden = secondAction == nil
        }
    }
    @IBOutlet private var backgroundView: DynamicBlurView! {
        didSet {
            backgroundView.blurRadius = 10
            backgroundView.isDeepRendering = true
        }
    }

    private let message: String?
    private var firstAction: AlertAction {
        didSet {
            configure(button: firstButton, with: firstAction)
        }
    }
    private let secondAction: AlertAction?


    // MARK: Initializers

    public init(title: String? = nil,
                message: String? = nil,
                firstAction: AlertAction = AlertAction(title: Strings.Common.Button.Ok.title),
                secondAction: AlertAction? = nil) {
        self.message = message
        self.firstAction = firstAction
        self.secondAction = secondAction

        super.init(nibName: String(describing: AlertViewController.self), bundle: nil)

        self.title = title
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        forceLightMode()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if alertView.alpha == 0 {
            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
                self.alertView.alpha = 1
            }, completion: nil)
        }
    }


    // MARK: Public

    var defaultButtonTitle = Strings.Common.Button.Ok.title {
        didSet {
            firstAction = AlertAction(title: defaultButtonTitle)
        }
    }



    // MARK: Actions

    @IBAction private func first() {
        dismiss(animated: true, completion: nil)
        firstAction.handler?(firstAction)
    }

    @IBAction private func second() {
        dismiss(animated: true, completion: nil)

        if let secondAction = secondAction {
            secondAction.handler?(secondAction)
        }
    }


    // MARK: Private

    private func configure(label: UILabel, with title: String?) {
        if let title = title, !title.isEmpty {
            label.text = title
            label.isHidden = false
        }
        else {
            label.isHidden = true
        }
    }

    private func configure(button: UIButton, with action: AlertAction?) {
        if let action = action {
            button.setTitle(action.title, for: .normal)
            button.isHidden = false
        }
        else {
            button.isHidden = true
        }
    }

}


open class AlertAction {

    // MARK: Properties

    let title: String
    let handler: ((AlertAction) -> Void)?


    // MARK: Initializers

    public init(title: String, handler: ((AlertAction) -> Void)? = nil) {
        self.title = title
        self.handler = handler
    }

}
