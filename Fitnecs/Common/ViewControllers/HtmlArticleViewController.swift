//
//  HtmlArticleViewController.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 7/6/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit

class HtmlArticleViewController: BaseViewController {
    // MARK: Properties

    @IBOutlet private var articleTitle: UILabel! {
        didSet {
            articleTitle.text = ""
        }
    }
    @IBOutlet private var articleTextView: UITextView! {
        didSet {
            articleTextView.text = ""
            articleTextView.textContainer.lineFragmentPadding = 0
            articleTextView.isHidden = true
        }
    }

    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var bottomGradientImageView: UIImageView!

    var viewModel: HtmlArticleViewModelProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.updateState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .normal:
                    self?.articleTextView.isHidden = false
                    self?.activityIndicator.stopAnimating()

                case .loading:
                    self?.articleTextView.isHidden = true
                    self?.activityIndicator.startAnimating()

                case .error:
                    self?.articleTextView.isHidden = true
                    self?.activityIndicator.stopAnimating()
                }
            }
        }

        viewModel?.updateScreen = { [weak self] viewData in
            DispatchQueue.main.async {
                self?.articleTitle.text = viewData.title
                self?.articleTextView.attributedText = viewData.text
            }
        }

        viewModel?.start(from: self)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        var bottomTextInset: CGFloat = 20
        var hideBottomGradient = true

        if view.bounds.height > 600 {
            bottomTextInset = 88
            hideBottomGradient = false
        }

        articleTextView.textContainerInset = UIEdgeInsets(top: 0, left: 20, bottom: bottomTextInset, right: 20)
        bottomGradientImageView.isHidden = hideBottomGradient
    }

    @IBAction private func backAction(_: Any) {
        viewModel?.back(from: self)
    }
}

extension HtmlArticleViewController: UITextViewDelegate {
    func textView(_: UITextView, shouldInteractWith URL: URL, in _: NSRange, interaction _: UITextItemInteraction) -> Bool {
        viewModel?.open(url: URL, from: self)
        return false
    }
}
