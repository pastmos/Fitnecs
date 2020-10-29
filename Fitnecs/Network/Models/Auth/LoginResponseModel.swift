//
//  LoginResponseModel.swift
//  Fitnecs
//
//  Created by Panov Sergey on 22.10.2020.
//

import Foundation

struct LoginResponseModel: Decodable {

    private enum CodingKeys: String, CodingKey {
        case token
    }

    let token: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LoginResponseModel.CodingKeys.self)

        self.token = try? container.decode(String.self, forKey: .token)
    }
}
