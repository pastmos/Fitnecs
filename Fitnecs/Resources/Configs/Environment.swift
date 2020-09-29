//
//  Environment.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 9/6/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Foundation

enum Environment {
    private enum Keys {
        static let baseURL = "BASE_URL"
        static let chatURL = "CHAT_URL"
        static let chatProjectId = "CHAT_PROJECT_ID"
        static let chatMessengerType = "CHAT_MESSENGER_TYPE"
        static let chatFileStorageURL = "CHAT_FILE_STORAGE_URL"
        static let multicardURL = "MULTICARD_URL"
        static let multibonusURL = "MULTIBONUS_URL"
        static let appId = "APP_ID"
        static let serverType = "SERVER_TYPE"
    }

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

    static let chatURL: URL = {
        let chatURLString: String = value(for: Keys.chatURL)

        guard let chatURL = URL(string: chatURLString) else {
            fatalError("\(Keys.chatURL) is invalid")
        }
        return chatURL
    }()

    static let chatProjectId: Int = {
        let projectId: String = value(for: Keys.chatProjectId)

        guard let value = Int(projectId) else {
            fatalError("\(Keys.chatProjectId): \(projectId) is not a Int)")
        }

        return value
    }()

    static let chatMessengerType: Int = {
        let messengerType: String = value(for: Keys.chatMessengerType)

        guard let value = Int(messengerType) else {
            fatalError("\(Keys.chatMessengerType): \(messengerType) is not a Int)")
        }

        return value
    }()

    static let chatFileStorageURL: URL = {
        let chatFileStorageURLString: String = value(for: Keys.chatFileStorageURL)

        guard let chatFileStorageURL = URL(string: chatFileStorageURLString) else {
            fatalError("\(Keys.chatFileStorageURL) is invalid")
        }
        return chatFileStorageURL
    }()

    static let multicardURL: URL = {
        let multicardURLString: String = value(for: Keys.multicardURL)

        guard let multicardURL = URL(string: multicardURLString) else {
            fatalError("\(Keys.multicardURL) is invalid")
        }
        return multicardURL
    }()

    static let multibonusURL: URL = {
        let multibonusURLString: String = value(for: Keys.multibonusURL)

        guard let multibonusURL = URL(string: multibonusURLString) else {
            fatalError("\(Keys.multibonusURL) is invalid")
        }
        return multibonusURL
    }()

    static let appId: String = {
        return value(for: Keys.appId)
    }()
}
