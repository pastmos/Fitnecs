//
//  AuthorizationAPI.swift
//  VTBMobile
//
//  Created by Panov Sergey on 6/5/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Moya

// MARK: - Authorization API

enum AuthorizationAPI {
    case requestUserPassword(phone: String, acceptBankingInformation: Bool?)
    case tokenAuth(username: String, password: String)
    case changePassword(password: String)

}

// MARK: - Target Type

extension AuthorizationAPI: TargetType, AccessTokenAuthorizable {

    var baseURL: URL {
        guard let url = URL(string: APIConfig.baseApiURL) else {
            fatalError("baseURL could not be configured.")
        }

        return url.appendingPathComponent(APIConfig.apiVersion)
    }

    var path: String {
        switch self {
        case .requestUserPassword: return "anonymous/request-user-password/"
        case .tokenAuth:           return "api-token-auth/"
        case .changePassword:      return "personal/change-password/"
        }
    }

    var method: Method {
        switch self {
        case .requestUserPassword, .tokenAuth, .changePassword:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .requestUserPassword(let phone, let acceptBankingInformation):
            var parameters: [String: Any] = ["phone": phone]

            if let acceptBankingInformation = acceptBankingInformation {
                parameters["acceptBankingInformation"] = acceptBankingInformation
            }
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)

        case .tokenAuth(let username, let password):
            let parameters = ["username": username, "password": password]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)

        case .changePassword(let password):
            let parameters = ["password": password]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }

    var headers: [String: String]? {
        let headers = ["Content-Type": "application/json"]
        return headers
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var authorizationType: AuthorizationType? {
        switch self {
        case .requestUserPassword, .tokenAuth: return .none
        case .changePassword:                  return .custom(APIConfig.tokenType)
        }
    }

}

// MARK: - Sample Data

extension AuthorizationAPI {
    var sampleData: Data {
        switch self {
        case .requestUserPassword, .changePassword:
            return stabbedResponse("RequestUserPassword")

        case .tokenAuth:
            return stabbedResponse("TokenAuth")
        }
    }
}

extension TargetType {
    func stabbedResponse(_ filename: String) -> Data! {
        if let filepath = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let content = try Data(contentsOf: URL(fileURLWithPath: filepath))
                return content
            }
            catch {
                // contents could not be loaded
            }
        }
        else {
            // example.txt not found!
        }

        return Data()
    }
}
