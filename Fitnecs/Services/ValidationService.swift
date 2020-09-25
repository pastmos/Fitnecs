//
//  ValidationService.swift
//  VTBMobile
//
//  Created by Evgeniy Mikholap on 6/27/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import Foundation


protocol ValidationService: AnyObject {

    func isEmailValid(_ text: String) -> Bool
    func isValidPromocode(_ code: String) -> Bool

    func isPhoneValid(_ text: String) -> Bool
    func clearPhone(from text: String) -> String
}


class ValidationServiceImplementation: ValidationService {

    // MARK: ValidationService

    func isEmailValid(_ text: String) -> Bool {
        guard !text.isEmpty else {
            return false
        }

        return isValidRegex("[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,6}", for: text)
    }

    func isValidPromocode(_ code: String) -> Bool {
        guard !code.isEmpty else {
            return false
        }

        return isValidRegex("[A-Z0-9]{9}", for: code)
    }

    func isPhoneValid(_ text: String) -> Bool {
        return clearPhone(from: text).count == 11
    }

    func clearPhone(from text: String) -> String {
        return text
            .trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            .components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }

    // MARK: Private

    private func isValidRegex(_ regex: String, for text: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)

        return predicate.evaluate(with: text)
    }

}
