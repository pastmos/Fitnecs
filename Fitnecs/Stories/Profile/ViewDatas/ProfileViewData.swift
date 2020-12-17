//
//  ProfileViewData.swift
//  Fitnecs
//
//  Created by Panov Sergey on 17.12.2020.
//  Copyright © 2020 Sergey Panov. All rights reserved.
//

import UIKit

struct ProfileViewData: Decodable {
    var name: String
    var email: String
    var userImage: String
    var points: String
}
