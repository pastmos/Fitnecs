//
//  LoginViewData.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 11/20/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import Foundation

protocol LoginViewDataType {

    var phone: String { get set }
    var password: String { get set }
    var nextButtonEnabled: Bool { get }

}


struct LoginViewData: LoginViewDataType {

    // MARK: PhoheViewDataType

    var phone: String
    var password: String
    var nextButtonEnabled: Bool {
        return validationService.isPhoneValid(phone) && !password.isEmpty
    }


    // MARK: Initializers

    init(phone: String = "", password: String = "", validationService: ValidationService = ValidationServiceImplementation()) {
        self.phone = phone
        self.password = password
        self.validationService = validationService
    }


    // MARK: Private

    private let validationService: ValidationService

}


enum LoginViewDataState {

    case normal, loading, error(viewData: ErrorViewDataType)

}
