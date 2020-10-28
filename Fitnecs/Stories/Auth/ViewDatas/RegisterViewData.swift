//
//  RegisterViewData.swift
//  Fitnecs
//
//  Created by Panov Sergey on 26.10.2020.
//

import Foundation

protocol RegisterViewDataType {

    var name: String { get set }
    var email: String { get set }
    var password: String { get set }
    var passwordConfirmation: String { get set }
    var isEmailValid: Bool { get }
    var isPasswordValid: Bool { get }
    var isPasswordConfirmationValid: Bool { get }
    var isRegisterDataValid: Bool { get }
    var arePasswordsEqual: Bool { get }
}


struct RegisterViewData: RegisterViewDataType {


    // MARK: PhoheViewDataType

    var name: String
    var email: String
    var password: String
    var passwordConfirmation: String

    var isEmailValid: Bool {
        return email.count > 8
    }
    var isPasswordValid: Bool {
        return password.count > 8
    }
    var isPasswordConfirmationValid: Bool {
        return passwordConfirmation.count > 8
    }

    var arePasswordsEqual: Bool {
        return password == passwordConfirmation
    }

    var isRegisterDataValid: Bool {
        return isPasswordValid && isEmailValid && isPasswordConfirmationValid && arePasswordsEqual
    }


    // MARK: Initializers

    init(name: String = "", email: String = "", password: String = "", passwordConfirmation: String = "") {
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
        self.name = name
    }


    // MARK: Private

}
