//
//  UploadAPI.swift
//  Fitnecs
//
//  Created by Panov Sergey on 29.10.2020.
//

import Moya

// MARK: - Authorization API

enum UploadAPI {
    case getInterval
    case uploadData(data: ActivityDataType)
}

// MARK: - Target Type

extension UploadAPI: TargetType, AccessTokenAuthorizable {

    var baseURL: URL {
        guard let url = URL(string: APIConfig.baseApiURL) else {
            fatalError("baseURL could not be configured.")
        }

        return url.appendingPathComponent(APIConfig.apiVersion)
    }

    var path: String {
        switch self {
        case .getInterval:  return "data/get-dates"
        case .uploadData:   return "data/store"
        }
    }

    var method: Method {
        switch self {
        case .uploadData:
            return .post
        default:
            return .get
        }
    }

    var task: Task {
        switch self {

        case .getInterval:
            return .requestPlain

        case .uploadData(let data):
            guard let data = data as? Encodable else {
                return .requestData(Data())
            }
            return .requestJSONEncodable(data)
        }
    }

    var headers: [String: String]? {
        let token = StorageServiceImplementation().stringFromKeychain(with: .token) ?? ""
        let headers = ["Content-Type": "application/json" , APIConfig.authHeader: token]
        return headers
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var authorizationType: AuthorizationType? {
        switch self {
        case .getInterval, .uploadData:
            return .custom(APIConfig.tokenType)
        default:
            return .none
        }
    }
    
    var sampleData: Data {
        return Data()
    }
}



