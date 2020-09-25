//
//  SmallModalViewData.swift
//  VTBMobile
//
//  Created by Evgeniy Mikholap on 7/4/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import Foundation


protocol SmallModalViewDataType {

    var title: String? { get }
    var text: String? { get }
    var actionButtonTitle: String? { get }
    var closeButtonTitle: String { get }
    var action: (() -> Void)? { get }
    var close: (() -> Void)? { get }
    var isTitleEmpty: Bool { get }
    var isTextEmpty: Bool { get }
    var shouldCloseOnAction: Bool { get }
    var state: SmallModalViewDataState { get set }
    var phone: String {get set}
}


struct SmallModalViewData: SmallModalViewDataType {

    // MARK: SmallModalViewDataType

    var title: String?
    var text: String?
    var actionButtonTitle: String?
    var closeButtonTitle: String
    var action: (() -> Void)?
    var close: (() -> Void)?
    var isTitleEmpty: Bool {
        return title?.isEmpty ?? true
    }
    var isTextEmpty: Bool {
        return text?.isEmpty ?? true
    }
    var shouldCloseOnAction: Bool
    var state: SmallModalViewDataState
    var phone: String


    // MARK: Initializers

    init(title: String? = nil,
         text: String? = nil,
         actionButtonTitle: String? = nil,
         shouldCloseOnAction: Bool = false,
         state: SmallModalViewDataState = .normal,
         closeButtonTitle: String = Strings.Common.Button.Cancel.title,
         phone: String = "",
         action: (() -> Void)? = nil,
         close: (() -> Void)? = nil) {
        self.title = title
        self.text = text
        self.actionButtonTitle = actionButtonTitle
        self.shouldCloseOnAction = shouldCloseOnAction
        self.state = state
        self.closeButtonTitle = closeButtonTitle
        self.action = action
        self.close = close
        self.phone = phone
    }

}


enum SmallModalViewDataState {

    case normal, loading

}
