//
//  PopupContentViewController.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 9/22/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import DynamicBlurView
import UIKit

class PopupContentViewController: UIViewController {

    @IBOutlet private var childContainerView: UIView! {
        didSet {
            childContainerView.layer.cornerRadius = 12
            childContainerView.layer.masksToBounds = true
        }
    }

    @IBOutlet private var backgroundView: DynamicBlurView! {
        didSet {
            backgroundView.blurRadius = 10
            backgroundView.isDeepRendering = true
        }
    }

    private var childContoller: UIViewController?

    init(contentController: UIViewController) {
        childContoller = contentController
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overFullScreen
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        forceLightMode()

        guard let controller = childContoller else {
            return
        }

        addChild(controller)
        childContainerView.addSubview(controller.view)

        controller.view.snp.makeConstraints({ maker in
            maker.edges.equalToSuperview()
        })

        controller.didMove(toParent: self)
    }

}
