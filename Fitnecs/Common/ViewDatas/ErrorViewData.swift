//
//  ErrorViewData.swift
//  VTBMobile
//
//  Created by Panov Sergey on 6/6/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Foundation


protocol ErrorViewDataType {

    var message: String { get }

}


struct ErrorViewData: ErrorViewDataType {

    // MARK: ErrorViewDataType

    var message: String {
        switch error {
        case .authenticationError(let error): return error.message
        case .badRequest(let error):          return error.message
        case .outdated(let error):            return error.message
        case .failed(let error, let code):    return error.message
        case .unableToDecode(let message):    return message
        case .custom(let message):            return message
        case .notConnectedToInternet:         return Strings.Network.Error.No.Internet.text
        case .timedOut:                       return Strings.Network.Error.Requet.Timed.Out.text
//        @unknown default:                     return Strings.Error.Unknown.message
        }
    }


    // MARK: Initializers

    init(error: APIError) {
        self.error = error
    }


    // MARK: Private

    private let error: APIError
}
