//
//  AuthorizationAPIService.swift
//  VTBMobile
//
//  Created by Panov Sergey on 6/5/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Moya


// MARK: - Authorization API Service

protocol AuthorizationAPIService {

    func registration(data: RegisterViewDataType, _ completion: @escaping (Result<RegistrationModel, APIError>) -> Void)
    func login(data: LoginViewDataType, _ completion: @escaping (Result<LoginModel, APIError>) -> Void)
}


// MARK: - Authorization API Service Implementation

class AuthorizationAPIServiceImplementation: BaseAPIService, AuthorizationAPIService {

    // MARK: AuthorizationAPIService

    func registration(data: RegisterViewDataType, _ completion: @escaping (Result<RegistrationModel, APIError>) -> Void) {
        provider.request(MultiTarget(AuthorizationAPI.registration(data: data))) { result in
            let handledResult = self.handleNetworkResult(result, responseObject: RegistrationModel.self)

            switch handledResult {
            case .success(let responseObject):
                completion(.success(responseObject))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func login(data: LoginViewDataType, _ completion: @escaping (Result<LoginModel, APIError>) -> Void) {
        provider.request(MultiTarget(AuthorizationAPI.login(data: data))) { result in
            let handledResult = self.handleNetworkResult(result, responseObject: LoginModel.self)

            switch handledResult {
            case .success(let responseObject):
                completion(.success(responseObject))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }


}
