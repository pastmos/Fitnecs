//
//  LoginViewData.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 11/20/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Foundation

protocol LoginViewDataType {

    var login: String { get set }
    var password: String { get set }
    var nextButtonEnabled: Bool { get }

}


struct LoginViewData: LoginViewDataType {

    // MARK: PhoheViewDataType

    var login: String
    var password: String
    var nextButtonEnabled: Bool {
        return !login.isEmpty && !password.isEmpty
    }


    // MARK: Initializers

    init(login: String = "", password: String = "", validationService: ValidationService = ValidationServiceImplementation()) {
        self.login = login
        self.password = password
        self.validationService = validationService
    }


    // MARK: Private

    private let validationService: ValidationService

}


enum LoginViewDataState {

    case normal, loading, error(viewData: ErrorViewDataType)

}
