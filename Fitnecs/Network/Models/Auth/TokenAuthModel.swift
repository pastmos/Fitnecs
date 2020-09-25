//
//  TokenAuthModel.swift
//  VTBMobile
//
//  Created by Evgeniy Mikholap on 6/6/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
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
