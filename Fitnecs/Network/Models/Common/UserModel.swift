//
//  UserModel.swift
//  VTBMobile
//
//  Created by Panov Sergey on 6/6/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Foundation


struct UserModel: Codable {

    private enum CodingKeys: String, CodingKey {

        case id
        case username
        case firstname = "firstName"
        case lastname = "lastName"
        case email
        case acceptBankingInformation

    }

    let id: Int
    let username: String
    let firstname: String?
    let lastname: String?
    let email: String
    let acceptBankingInformation: Bool


}
