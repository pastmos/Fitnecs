//
//  BaseCoverContentViewController.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 6/24/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit
import SnapKit


class BaseCoverContentViewController: UIViewController, CoverTransitionContext {

    var onDeinit: (() -> Void)?

    deinit {
        onDeinit?()
    }

    // MARK: Properties

    @IBOutlet private var backgroundView: UIView! {
        didSet {
            backgroundView.backgroundColor = backgroundColor
        }
    }
    @IBOutlet private var contentFixedTopConstraint: NSLayoutConstraint!
    @IBOutlet private var contentFlexibleTopConstraint: NSLayoutConstraint!
    @IBOutlet private var contentView: RoundedView! {
        didSet {
            contentView.backgroundColor = contentViewBackgroundColor
        }
    }
    @IBOutlet private var childContainerView: UIView!
    @IBOutlet private var headerView: UIView!
    @IBOutlet private var markView: UIView! {
        didSet {
            markView.layer.cornerRadius = 3
            markView.layer.masksToBounds = true
            markView.backgroundColor = contentMode == .normal ? Assets.Colors.graySeparatorColor.color.withAlphaComponent(0.6) : Assets.Colors.mainTextColor.color.withAlphaComponent(0.5)
        }
    }
    @IBOutlet private var childContainerViewTopLayoutConstraint: NSLayoutConstraint!
    @IBOutlet private var headerViewHeightLayoutConstraint: NSLayoutConstraint!

    var headerViewHeight: CGFloat =  60

    private(set) var mode: Mode
    private var contentMode: ContentMode
    private weak var childContoller: UIViewController?
    private var coverTransitionManager: CoverTransitionManager
    private var contentViewBackgroundColor: UIColor
    private var backgroundColor: UIColor

    enum Mode {

        case fullScreen
        case fitContentSize

    }

    enum ContentMode {

        case normal
        case full

    }

    // MARK: Initializers

    init(contentController: UIViewController,
         mode: Mode = .fullScreen,
         contentMode: ContentMode = .normal,
         contentViewBackgroundColor: UIColor = Assets.Colors.mainBackgroundColor.color,
         backgroundColor: UIColor = Assets.Colors.mainRootBackground.color) {
        self.mode = mode
        self.contentMode = contentMode
        self.contentViewBackgroundColor = contentViewBackgroundColor
        self.backgroundColor = backgroundColor
        childContoller = contentController
        coverTransitionManager = CoverTransitionManager()
        super.init(nibName: nil, bundle: nil)
        coverTransitionManager.prepare(self)
    }

    required init?(coder aDecoder: NSCoder) {
        mode = .fullScreen
        contentMode = .normal
        contentViewBackgroundColor = Assets.Colors.mainBackgroundColor.color
        backgroundColor = Assets.Colors.mainRootBackground.color
        coverTransitionManager = CoverTransitionManager()

        super.init(coder: aDecoder)
    }


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        forceLightMode()

        if let controller = childContoller {
            change(controller: controller)
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        if let childContainerViewTopLayoutConstraint = childContainerViewTopLayoutConstraint {
            childContainerViewTopLayoutConstraint.constant = contentMode == .normal ? 50 : 0
            childContainerView.layoutIfNeeded()
        }
        if let headerViewHeightLayoutConstraint = headerViewHeightLayoutConstraint {
            headerViewHeightLayoutConstraint.constant = headerViewHeight
            headerView.layoutIfNeeded()
        }
    }


    // MARK: Public

    func loadFromStoryboard(contentController: UIViewController,
                            mode: Mode = .fullScreen,
                            contentMode: ContentMode = .normal,
                            contentViewBackgroundColor: UIColor = Assets.Colors.mainBackgroundColor.color,
                            backgroundColor: UIColor = Assets.Colors.mainRootBackground.color) {
        self.mode = mode
        self.contentMode = contentMode
        self.contentViewBackgroundColor = contentViewBackgroundColor
        self.backgroundColor = backgroundColor
        childContoller = contentController
        coverTransitionManager = CoverTransitionManager()
        coverTransitionManager.prepare(self)
    }

    func change(controller: UIViewController) {
        contentFixedTopConstraint.isActive = mode == .fullScreen
        contentFlexibleTopConstraint.isActive = mode == .fitContentSize
        embedController(controller)
    }


    // MARK: Private

    private func embedController(_ controller: UIViewController) {
        children.forEach {
            $0.didMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        }

        addChild(controller)
        childContainerView.addSubview(controller.view)

//        controller.view
//            .leadingAnchor(equalTo: childContainerView.leadingAnchor)
//            .topAnchor(equalTo: childContainerView.topAnchor)
//            .trailingAnchor(equalTo: childContainerView.trailingAnchor)
//            .bottomAnchor(equalTo: childContainerView.bottomAnchor)
//            .translatesAutoresizingMaskIntoConstraints = false
        controller.view.snp.makeConstraints({ maker in
            maker.edges.equalToSuperview()
        })

        controller.didMove(toParent: self)
        self.becomeFirstResponder()
    }

}


extension BaseCoverContentViewController {

    var dimmingView: UIView { return backgroundView }
    var coverView: UIView { return contentView }
    var dismissHeaderView: UIView { return headerView }

}
