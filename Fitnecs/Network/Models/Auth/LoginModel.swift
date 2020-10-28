//
//  LoginModel.swift
//  Fitnecs
//
//  Created by Panov Sergey on 22.10.2020.
//

import Foundation

struct LoginModel: Codable {

    private enum CodingKeys: String, CodingKey {
        case token
    }

    let token: String
}
