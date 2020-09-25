//
//  SmallModalViewController.swift
//  VTBMobile
//
//  Created by Evgeniy Mikholap on 7/1/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import UIKit


// MARK: - SmallModalViewController

class SmallModalViewController: BaseViewController {

    // MARK: Properties

    @IBOutlet private var mainStackView: UIStackView! {
        didSet {
            configMain(mainStackView)
        }
    }
    @IBOutlet private var textStackView: UIStackView! {
        didSet {
            config(textStackView)
        }
    }
    @IBOutlet private var titleLabel: UILabel! {
        didSet {
            configTitle(titleLabel)
        }
    }
    @IBOutlet private var textLabel: UILabel! {
        didSet {
            configText(textLabel)
        }
    }
    @IBOutlet private var actionButton: UIButton! {
        didSet {
            configAction(actionButton)
            adjustFont(for: actionButton)
        }
    }
    @IBOutlet private var closeButton: UIButton! {
        didSet {
            configClose(closeButton)
            adjustFont(for: closeButton)
        }
    }
    @IBOutlet private var activityIndicator: UIActivityIndicatorView! {
        didSet {
            config(activityIndicator)
        }
    }
    @IBOutlet private var mainStackViewLeadingLayoutConstraint: NSLayoutConstraint!
    @IBOutlet private var mainStackViewTrailingLayoutConstraint: NSLayoutConstraint!

    private var viewData: SmallModalViewDataType? {
        didSet {
            configMain(mainStackView)
            config(textStackView)
            configTitle(titleLabel)
            configText(textLabel)
            configAction(actionButton)
            configClose(closeButton)
            config(activityIndicator)
        }
    }

    private enum Constants {

        static let bigTitleSize: CGFloat = 28
        static let smallTitleSize: CGFloat = 22

    }


    // MARK: Lifecycle

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let isSmallWidth = view.bounds.width < 375
        let mainStackViewPadding: CGFloat = isSmallWidth ? 12 : 24

        mainStackViewLeadingLayoutConstraint.constant = mainStackViewPadding
        mainStackViewTrailingLayoutConstraint.constant = mainStackViewPadding
    }


    // MARK: Public

    func bind(viewData: SmallModalViewDataType) {
        self.viewData = viewData
    }


    // MARK: Actions

    @IBAction private func action() {
        viewData?.action?()
        if viewData?.shouldCloseOnAction ?? true {
            dismiss(animated: true, completion: nil)
        }
    }

    @IBAction private func close() {
        viewData?.close?()
        dismiss(animated: true, completion: nil)
    }


    // MARK: Private

    private func configMain(_ mainStackView: UIStackView?) {
        if let mainStackView = mainStackView, let state = viewData?.state {
            mainStackView.isHidden = state == .loading
        }
    }

    private func config(_ textStackView: UIStackView?) {
        if let textStackView = textStackView {
            let isTitleEmpty = viewData?.isTitleEmpty ?? true
            let isTextEmpty = viewData?.isTextEmpty ?? true

            textStackView.isHidden = isTitleEmpty && isTextEmpty
        }
    }

    private func configTitle(_ titleLabel: UILabel?) {
        if let titleLabel = titleLabel {
            let isTitleEmpty = viewData?.isTitleEmpty ?? true
            let isTextEmpty = viewData?.isTextEmpty ?? true
            titleLabel.font = UIFont.systemFont(ofSize: isTitleEmpty || isTextEmpty ? Constants.smallTitleSize : Constants.bigTitleSize, weight: .bold)

            if let title = viewData?.title, !title.isEmpty {
                titleLabel.text = title
                titleLabel.isHidden = false
            }
            else {
                titleLabel.isHidden = true
            }
        }
    }

    private func configText(_ textLabel: UILabel?) {
        if let textLabel = textLabel {
            if let text = viewData?.text, !text.isEmpty {
                textLabel.text = text
                textLabel.isHidden = false
            }
            else {
                textLabel.isHidden = true
            }
        }
    }

    private func configAction(_ actionButton: UIButton?) {
        if let actionButton = actionButton {
            if let actionButtonTitle = viewData?.actionButtonTitle {
                actionButton.setTitle(actionButtonTitle.localizedUppercase, for: .normal)
            }

            actionButton.isEnabled = viewData?.action != nil
        }
    }

    private func configClose(_ closeButton: UIButton?) {
        if let closeButton = closeButton {
            closeButton.setTitle(viewData?.closeButtonTitle.localizedUppercase, for: .normal)
        }
    }

    private func config(_ activityIndicator: UIActivityIndicatorView?) {
        if let activityIndicator = activityIndicator {
            if let viewData = viewData, viewData.state == .loading {
                activityIndicator.startAnimating()
            }
            else {
                activityIndicator.stopAnimating()
            }
        }
    }

    private func adjustFont(for button: UIButton) {
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.lineBreakMode = .byClipping
        button.titleLabel?.baselineAdjustment = .alignCenters
    }

}
