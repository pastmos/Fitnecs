//
//  AlertViewData.swift
//  VTBMobile
//
//  Created by Evgeniy Mikholap on 6/17/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import UIKit


protocol AlertViewDataType {

    var title: String? { get }
    var text: String? { get }
    var actionButtonTitle: String? { get }
    var closeButtonTitle: String { get }
    var action: (() -> Void)? { get }
    var close: (() -> Void)? { get }

}


struct AlertViewData: AlertViewDataType {

    // MARK: AlertViewDataType

    var title: String?
    var text: String?
    var actionButtonTitle: String?
    var closeButtonTitle: String
    var action: (() -> Void)?
    var close: (() -> Void)?


    // MARK: Initializers

    init(title: String? = nil,
         text: String? = nil,
         actionButtonTitle: String? = nil,
         closeButtonTitle: String,
         action: (() -> Void)? = nil,
         close: (() -> Void)? = nil) {
        self.title = title
        self.text = text
        self.actionButtonTitle = actionButtonTitle
        self.closeButtonTitle = closeButtonTitle
        self.action = action
        self.close = close
    }

}

extension AlertViewData {
    static func viewData(with error: APIError, retryAction: (() -> Void)? = nil) -> AlertViewData {
        let errorViewData = ErrorViewData(error: error)

        if error == .notConnectedToInternet || retryAction == nil {
            return AlertViewData(title: Strings.error,
                                 text: errorViewData.message,
                                 closeButtonTitle: Strings.Common.Button.Ok.title)
        }
        else {
            return AlertViewData(title: Strings.Common.Error.title,
                                 text: errorViewData.message,
                                 actionButtonTitle: Strings.Common.Error.Button.Retry.title,
                                 closeButtonTitle: Strings.Common.Button.Close.title,
                                 action: retryAction)
        }
    }
}
