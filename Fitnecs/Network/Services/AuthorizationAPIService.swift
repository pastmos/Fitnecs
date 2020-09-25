//
//  AuthorizationAPIService.swift
//  VTBMobile
//
//  Created by Evgeniy Mikholap on 6/5/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import Moya


// MARK: - Authorization API Service

protocol AuthorizationAPIService {

    func requestUserPassword(phone: String, acceptBankingInformation: Bool?, _ completion: @escaping (Result<UserRequestModel, APIError>) -> Void)
    func tokenAuth(username: String, password: String, _ completion: @escaping (Result<TokenAuthModel, APIError>) -> Void)
    func changePassword(password: String, _ completion: @escaping (Result<UserRequestModel, APIError>) -> Void)

}


// MARK: - Authorization API Service Implementation

class AuthorizationAPIServiceImplementation: BaseAPIService, AuthorizationAPIService {

    // MARK: AuthorizationAPIService

    func requestUserPassword(phone: String, acceptBankingInformation: Bool?, _ completion: @escaping (Result<UserRequestModel, APIError>) -> Void) {
        provider.request(MultiTarget(AuthorizationAPI.requestUserPassword(phone: phone, acceptBankingInformation: acceptBankingInformation))) { result in
            let handledResult = self.handleNetworkResult(result, responseObject: UserRequestModel.self)

            switch handledResult {
            case .success(let responseObject):
                completion(.success(responseObject))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func tokenAuth(username: String, password: String, _ completion: @escaping (Result<TokenAuthModel, APIError>) -> Void) {
        provider.request(MultiTarget(AuthorizationAPI.tokenAuth(username: username, password: password))) { result in
            let handledResult = self.handleNetworkResult(result, responseObject: TokenAuthModel.self)

            switch handledResult {
            case .success(let responseObject):
                completion(.success(responseObject))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func changePassword(password: String, _ completion: @escaping (Result<UserRequestModel, APIError>) -> Void) {
        provider.request(MultiTarget(AuthorizationAPI.changePassword(password: password))) { [weak errorHandler = authErrorHandler] result in
            let handledResult = self.handleNetworkResult(result, responseObject: UserRequestModel.self)

            switch handledResult {
            case .success(let responseObject):
                completion(.success(responseObject))

            case .failure(let error):
                if let errorHandler = errorHandler, errorHandler.handleError(error) == true {
                    return
                }
                completion(.failure(error))
            }
        }
    }

}
