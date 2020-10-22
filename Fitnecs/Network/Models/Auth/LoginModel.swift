//
//  LoginModel.swift
//  Fitnecs
//
//  Created by Panov Sergey on 22.10.2020.
//

import Foundation

struct LoginModel: Codable {

    private enum CodingKeys: String, CodingKey {
        case success
        case token
    }

    let success: String
    let token: String
}
