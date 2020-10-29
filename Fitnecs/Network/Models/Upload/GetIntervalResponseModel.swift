//
//  GetIntervalResponseModel.swift
//  Fitnecs
//
//  Created by Panov Sergey on 29.10.2020.
//

struct GetIntervalResponseModel: Codable {

    private enum CodingKeys: String, CodingKey {
        case token
    }

    let token: String
}
