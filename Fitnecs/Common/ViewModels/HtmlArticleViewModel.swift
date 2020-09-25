//
//  HtmlArticleViewModel.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 7/6/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import UIKit

protocol HtmlArticleViewModelCoordinatorDelegate: ViewModelCoordinatorDelegate {
    func open(url: URL, from controller: UIViewController)
}

protocol HtmlArticleViewModelProtocol: AnyObject {
    // MARK: Delegates

    var coordinatorDelegate: HtmlArticleViewModelCoordinatorDelegate? { get }

    // MARK: Data Sources

    // MARK: Callbacks

    var updateState: ((HtmlArticleViewDataState) -> Void)? { get set }
    var updateScreen: ((HtmlArticleViewDataType) -> Void)? { get set }

    // MARK: Events

    func start(from controller: UIViewController)
    func back(from controller: UIViewController)
    func open(url: URL, from controller: UIViewController)
}

class HtmlArticleViewModel: HtmlArticleViewModelProtocol {
    // MARK: Delegates

    weak var coordinatorDelegate: HtmlArticleViewModelCoordinatorDelegate?

    // MARK: Data Sources

    // MARK: Callbacks

    var updateState: ((HtmlArticleViewDataState) -> Void)?
    var updateScreen: ((HtmlArticleViewDataType) -> Void)?

    // MARK: Events

    func start(from controller: UIViewController) {
        state = .normal
        updateScreen?(viewData)
    }

    func back(from controller: UIViewController) {
        coordinatorDelegate?.close(from: controller)
    }

    func open(url: URL, from controller: UIViewController) {
        coordinatorDelegate?.open(url: url, from: controller)
    }

    // MARK: Initializers

    init(title: String, text: String, config: HtmlArticleViewData.Config = .default) {
        state = .normal
        viewData = HtmlArticleViewData(title: title, text: text, config: config)
    }

    // MARK: Private

    private var state: HtmlArticleViewDataState {
        didSet {
            updateState?(state)
        }
    }

    private var viewData: HtmlArticleViewDataType {
        didSet {
            updateScreen?(viewData)
        }
    }
}
