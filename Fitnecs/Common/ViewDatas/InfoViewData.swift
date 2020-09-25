//
//  InfoViewData.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 11/25/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import Foundation

protocol InfoViewDataType {

    var title: String? { get }
    var text: String? { get }
    var actionButtonTitle: String? { get }
    var action: (() -> Void)? { get }
    var onCloseAction: (() -> Void)? { get }
    var isTitleEmpty: Bool { get }
    var isTitleCentered: Bool { get }
    var isTextEmpty: Bool { get }
    var shouldCloseOnAction: Bool { get }
}


struct InfoViewData: InfoViewDataType {

    // MARK: InfoViewDataType

    var title: String?
    var text: String?
    var actionButtonTitle: String?
    var action: (() -> Void)?
    var onCloseAction: (() -> Void)?
    var isTitleEmpty: Bool {
        return title?.isEmpty ?? true
    }
    var isTitleCentered: Bool

    var isTextEmpty: Bool {
        return text?.isEmpty ?? true
    }
    var shouldCloseOnAction: Bool


    // MARK: Initializers

    init(title: String? = nil,
         text: String? = nil,
         actionButtonTitle: String? = Strings.Common.Button.Ok.title, isTitleCentered: Bool = false,
         shouldCloseOnAction: Bool = true,
         action: (() -> Void)? = nil, onCloseAction: (() -> Void)? = nil) {
        self.title = title
        self.text = text
        self.isTitleCentered = isTitleCentered
        self.actionButtonTitle = actionButtonTitle
        self.shouldCloseOnAction = shouldCloseOnAction
        self.action = action
        self.onCloseAction = onCloseAction
    }

}
