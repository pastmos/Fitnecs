//
//  ErrorModel.swift
//  VTBMobile
//
//  Created by Panov Sergey on 6/5/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Foundation


struct ErrorModel: Codable, Equatable {

    enum ErrorType {
        case phoneError
        case sumError
    }

    private enum CodingKeys: String, CodingKey {

        case error
        case detail

    }

    var message: String

    var errorType: ErrorModel.ErrorType? = nil

    init(from decoder: Decoder) throws {
        let dict = try decoder.container(keyedBy: CodingKeys.self)

        if let message = try dict.decodeIfPresent(String.self, forKey: .error) {
            self.message = message
            return
        }

        if let message = try dict.decodeIfPresent(String.self, forKey: .detail) {
            self.message = message
            return
        }

        message = "Error decoding failed"
    }

    init(message: String) {
        self.message = message
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(message, forKey: .error)
        try container.encodeIfPresent(message, forKey: .detail)
    }

}
