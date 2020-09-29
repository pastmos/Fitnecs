//
//  TokenAuthModel.swift
//  VTBMobile
//
//  Created by Panov Sergey on 6/6/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Foundation


struct TokenAuthModel: Codable {

    private enum CodingKeys: String, CodingKey {

        case key
        case createdDate = "created"
        case user

    }

    let key: String
    let createdDate: Date
    let user: UserModel

}
