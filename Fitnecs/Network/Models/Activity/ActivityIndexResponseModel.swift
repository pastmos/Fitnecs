//
//  ActivityIndexResponseModel.swift
//  Fitnecs
//
//  Created by Panov Sergey on 24.12.2020.
//  Copyright © 2020 Sergey Panov. All rights reserved.
//

struct ActivityIndexResponseModel: Codable {

    private enum CodingKeys: String, CodingKey {
        case activityIndex = "activity_index"
        case message
    }

    let activityIndex: Int
    let message: String
}
