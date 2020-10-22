//
//  RegistrationModel.swift
//  VTBMobile
//
//  Created by Panov Sergey on 6/6/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Foundation


struct RegistrationModel: Codable {

    private enum CodingKeys: String, CodingKey {
        case token
    }

    let token: String
}
