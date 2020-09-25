//
//  ConfirmationModel.swift
//  Fitnecs
//
//  Created by Past on 23.09.2020.
//

import Foundation

enum ConfirmationModelType: Int {

    case without = 1
    case code = 2
    case password = 3
    case none

    static func type(number: Int) -> ConfirmationModelType {
        switch number {
        case without.rawValue:  return .without
        case code.rawValue:     return .code
        case password.rawValue: return .password
        default:                return .none
        }
    }
}
