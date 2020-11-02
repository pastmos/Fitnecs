//
//  APIConfig.swift
//  VTBMobile
//
//  Created by Panov Sergey on 6/11/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Foundation

enum APIConfig {
    static let baseURL = Environment.baseURL
    static let baseApiURL = baseURL + "api/"
    static let apiVersion = "v1"
    static let authHeader = "x-api-key"
    static let tokenType = ""
}
