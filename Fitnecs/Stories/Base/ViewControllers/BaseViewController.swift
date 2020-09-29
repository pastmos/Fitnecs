//
//  BaseViewController.swift
//  VTBMobile
//
//  Created by Panov Sergey on 5/30/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit

extension UIViewController {
    func forceLightMode() {
        #if compiler(>=5.1)
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }
        #endif
    }
}

// MARK: - BaseViewController

class BaseViewController: UIViewController {

    var onDeinit: (() -> Void)?

    deinit {
        onDeinit?()
    }

    // MARK: Properties

    private var popRecognizer: InteractivePopRecognizer?


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        forceLightMode()

        configureInteractiveRecognizer()

        view.backgroundColor = Assets.Colors.mainBackgroundColor.color

        setNeedsStatusBarAppearanceUpdate()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }


    // MARK: Private

    private func configureInteractiveRecognizer() {
        guard let controller = navigationController else {
            return
        }

        popRecognizer = InteractivePopRecognizer(controller: controller)
        controller.interactivePopGestureRecognizer?.delegate = popRecognizer
    }

}
