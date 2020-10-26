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
    var nextButtonEnabled: Bool { get }
    var isEmailValid: Bool { get }
    var isPasswordValid: Bool { get }
    var isRegisterDataValid: Bool { get }
}


struct RegisterViewData: RegisterViewDataType {


    // MARK: PhoheViewDataType

    var name: String
    var email: String
    var password: String
    var passwordConfirmation: String

    var isEmailValid: Bool {
        return !email.isEmpty
    }
    var isPasswordValid: Bool {
        return (password.count > 8) && (passwordConfirmation.count > 8) && (password == passwordConfirmation)
    }
    var isRegisterDataValid: Bool {
        return isPasswordValid && isEmailValid
    }
    var nextButtonEnabled: Bool {
        return !email.isEmpty && !password.isEmpty
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
