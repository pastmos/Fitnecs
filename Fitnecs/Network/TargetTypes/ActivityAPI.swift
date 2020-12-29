//
//  ActivityAPI.swift
//  Fitnecs
//
//  Created by Panov Sergey on 24.12.2020.
//  Copyright © 2020 Sergey Panov. All rights reserved.
//

import Moya

// MARK: - Authorization API

enum ActivityAPI {
    case getActivityIndex
}

// MARK: - Target Type

extension ActivityAPI: TargetType, AuthorizedTargetType {

    var baseURL: URL {
        guard let url = URL(string: APIConfig.baseApiURL) else {
            fatalError("baseURL could not be configured.")
        }

        return url.appendingPathComponent(APIConfig.apiVersion)
    }

    var path: String {
        switch self {
        case .getActivityIndex:  return "activity/index"
        }
    }

    var method: Method {
        switch self {
        default:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getActivityIndex:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        let headers = ["Content-Type": "application/json"]
        return headers
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var needsAuth: Bool {
        return true
    }

    var sampleData: Data {
        return Data()
    }
}
