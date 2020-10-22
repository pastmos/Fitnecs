//
//  Environment.swift
//  VTBMobile
//
//  Created by Panov Sergey on 9/6/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Foundation

enum Environment {
    private enum Keys {
        static let baseURL = "BASE_URL"
        static let serverType = "SERVER_TYPE"
    }

    static let googleApiKey = "AIzaSyC7H6mZQd64iOS8eDJJeobGW4eTV_xjXjI"

    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()

    private static func value<T>(for key: String) -> T {
        guard let data = Environment.infoDictionary[key] else {
            fatalError("\(key) not set in plist for this environment")
        }
        guard let value = data as? T else {
            fatalError("\(key): \(data) is not a \(type(of: T.self))")
        }
        return value
    }

    static let serverType: String = {
        let serverType: String = value(for: Keys.serverType)
        return serverType
    }()


    static let baseURL: String = {
        let baseURL: String = value(for: Keys.baseURL)

        guard let _ = URL(string: baseURL) else {
            fatalError("\(Keys.baseURL) is invalid")
        }
        return baseURL
    }()

}
