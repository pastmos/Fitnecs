//
//  InfoViewController.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 11/25/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit


// MARK: - InfoViewController

class InfoViewController: BaseViewController {

    // MARK: Properties

    @IBOutlet private var mainStackView: UIStackView!
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
    @IBOutlet private var mainStackViewLeadingLayoutConstraint: NSLayoutConstraint!
    @IBOutlet private var mainStackViewTrailingLayoutConstraint: NSLayoutConstraint!

    private var viewData: InfoViewDataType? {
        didSet {
            config(textStackView)
            configTitle(titleLabel)
            configText(textLabel)
            configAction(actionButton)
        }
    }

    private enum Constants {

        static let bigTitleSize: CGFloat = 28
        static let smallTitleSize: CGFloat = 22

    }


    // MARK: Lifecycle

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let isSmallWidth = view.bounds.width < 335
        let mainStackViewPadding: CGFloat = isSmallWidth ? 12 : 24

        mainStackViewLeadingLayoutConstraint.constant = mainStackViewPadding
        mainStackViewTrailingLayoutConstraint.constant = mainStackViewPadding
    }


    // MARK: Public

    func bind(viewData: InfoViewDataType) {
        self.viewData = viewData
    }


    // MARK: Actions

    @IBAction private func action() {
        viewData?.action?()
        if viewData?.shouldCloseOnAction ?? true {
            dismiss(animated: true, completion: viewData?.onCloseAction)
        }
    }

    // MARK: Private

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
            let isTitleCentered = viewData?.isTitleCentered ?? false
            titleLabel.font = UIFont.systemFont(ofSize: isTitleEmpty || isTextEmpty ? Constants.smallTitleSize : Constants.bigTitleSize, weight: .bold)

            titleLabel.textAlignment = isTitleCentered ? .center : .left

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
        }
    }
    private func adjustFont(for button: UIButton) {
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.lineBreakMode = .byClipping
        button.titleLabel?.baselineAdjustment = .alignCenters
    }

}
