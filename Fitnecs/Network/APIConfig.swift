//
//  APIConfig.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 6/11/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import Foundation

enum APIConfig {
    static let baseURL = Environment.baseURL
    static let baseApiURL = baseURL + "api/"
    static let apiVersion = "v1"
    static let tokenType = "Token"
    static let mapURL = baseURL + "maps/"
    static let onboardingMapURL = baseURL + "maps/?onlyoffices=true"
    static let chatURL = "https://k4-vo.vtb24.ru/webChat/"
}
