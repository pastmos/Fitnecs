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
    case login(login: String, password: String)
    case registration(login: String, password: String)
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
        case .login:           return "auth/"
        case .registration:    return "registration/"
        }
    }

    var method: Method {
        switch self {
        case .login, .registration:
            return .post
        }
    }

    var task: Task {
        switch self {

        case .login(let username, let password):
            let parameters = ["login": username, "password": password]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)

        case .registration(let username, let password):
            let parameters = ["login": password, "password": password]
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
        case .registration, .login: return .none
        }
    }

}

// MARK: - Sample Data

extension AuthorizationAPI {
    var sampleData: Data {
        switch self {
        case .login, .registration:
            return stabbedResponse("RequestUserPassword")
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
