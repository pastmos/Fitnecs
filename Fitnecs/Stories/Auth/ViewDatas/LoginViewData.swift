//
//  LoginViewData.swift
//  VTBMobile
//
//  Created by Panov Sergey on 11/20/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Foundation

protocol LoginViewDataType {

    var email: String { get set }
    var password: String { get set }
    var isEmailValid: Bool { get }
    var isPasswordValid: Bool { get }
    var isLoginDataValid: Bool { get }
}


struct LoginViewData: LoginViewDataType {
    

    // MARK: PhoheViewDataType

    var email: String
    var password: String

    var isEmailValid: Bool {
        return !email.isEmpty
    }
    var isPasswordValid: Bool {
        return !password.isEmpty
    }
    var isLoginDataValid: Bool {
        return isPasswordValid && isEmailValid
    }



    // MARK: Initializers

    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }


    // MARK: Private

}


enum LoginViewDataState {

    case normal, loading, error(viewData: ErrorViewDataType)

}
