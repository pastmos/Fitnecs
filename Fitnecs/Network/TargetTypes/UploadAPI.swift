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
        case .getInterval:  return "api/v1/data/get-dates"
        case .uploadData:   return "/api/v1/data/store"
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
            return .requestParameters(parameters: [:], encoding: JSONEncoding.default)

        case .uploadData(let data):
            let parameters = [
                "activeEnergyBurned": data.activeEnergyBurned,
                "bloodPressureDiastolic": data.bloodPressureDiastolic,
                "bloodPressureSystolic": data.bloodPressureSystolic,
                "bodyMass": data.bodyMass,
                "bodyMassIndex": data.bodyMassIndex,
                "bodyTemperature": data.bodyTemperature,
                "distanceWalkingRunning": data.distanceWalkingRunning,
                "flightsClimbed": data.flightsClimbed,
                "heartRate": data.heartRate,
                "height": data.height,
                "oxygenSaturation": data.oxygenSaturation,
                "stepCount": data.stepCount,
                "sleepAnalysis": data.sleepAnalysis
            ] as [String : Any]
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
