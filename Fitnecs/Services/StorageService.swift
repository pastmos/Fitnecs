//
//  StorageService.swift
//  VTBMobile
//
//  Created by Panov Sergey on 6/10/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Foundation

import KeychainSwift

enum KeychainStorage {
    struct Key {
        init(_ rawValue: String) {
            self.rawValue = rawValue
        }

        init(rawValue: String) {
            self.rawValue = rawValue
        }

        let rawValue: String
    }
}

enum UserDefaultsStorage {
    struct Key {
        init(_ rawValue: String) {
            self.rawValue = rawValue
        }

        init(rawValue: String) {
            self.rawValue = rawValue
        }

        let rawValue: String
    }
}


protocol StorageService: AnyObject {

    func saveInKeychain(string: String, with key: KeychainStorage.Key)
    func stringFromKeychain(with key: KeychainStorage.Key) -> String?
    func removeFromKeychain(forKey key: KeychainStorage.Key)
    func removeFromKeychain(forKeys keys: [KeychainStorage.Key])

    func saveInUserDefaults(bool: Bool, with key: UserDefaultsStorage.Key)
    func boolFromUserDefaults(with key: UserDefaultsStorage.Key) -> Bool?
    func saveInUserDefaults(number: Int, with key: UserDefaultsStorage.Key)
    func numberFromUserDefaults(with key: UserDefaultsStorage.Key) -> Int?
    func saveInUserDefaults(string: String, with key: UserDefaultsStorage.Key)
    func stringFromUserDefaults(with key: UserDefaultsStorage.Key) -> String?
    func saveInUserDefaults(data: Data, with key: UserDefaultsStorage.Key)
    func dataFromUserDefaults(with key: UserDefaultsStorage.Key) -> Data?
    func removeFromUserDefaults(forKey key: UserDefaultsStorage.Key)

}


class StorageServiceImplementation: StorageService {

    // MARK: Properties

    private let keychain: KeychainSwift
    private let userDefaults: UserDefaults


    // MARK: Initializers

    init(keychain: KeychainSwift = KeychainSwift(), userDefaults: UserDefaults = UserDefaults()) {
        self.keychain = keychain
        self.userDefaults = userDefaults
    }


    // MARK: StorageService

    func saveInKeychain(string: String, with key: KeychainStorage.Key) {
        keychain.set(string, forKey: key.rawValue, withAccess: .accessibleWhenUnlockedThisDeviceOnly)
    }

    func stringFromKeychain(with key: KeychainStorage.Key) -> String? {
        return keychain.get(key.rawValue)
    }

    func removeFromKeychain(forKey key: KeychainStorage.Key) {
        keychain.delete(key.rawValue)
    }

    func removeFromKeychain(forKeys keys: [KeychainStorage.Key]) {
        keys.forEach {
            removeFromKeychain(forKey: $0)
        }
    }

    func saveInUserDefaults(bool: Bool, with key: UserDefaultsStorage.Key) {
        userDefaults.set(bool, forKey: key.rawValue)
    }

    func boolFromUserDefaults(with key: UserDefaultsStorage.Key) -> Bool? {
        return userDefaults.bool(forKey: key.rawValue)
    }

    func saveInUserDefaults(number: Int, with key: UserDefaultsStorage.Key) {
        userDefaults.set(number, forKey: key.rawValue)
    }

    func numberFromUserDefaults(with key: UserDefaultsStorage.Key) -> Int? {
        return userDefaults.integer(forKey: key.rawValue)
    }

    func saveInUserDefaults(string: String, with key: UserDefaultsStorage.Key) {
        userDefaults.set(string, forKey: key.rawValue)
    }

    func stringFromUserDefaults(with key: UserDefaultsStorage.Key) -> String? {
        return userDefaults.string(forKey: key.rawValue)
    }

    func removeFromUserDefaults(forKey key: UserDefaultsStorage.Key) {
        userDefaults.removeObject(forKey: key.rawValue)
    }

    func saveInUserDefaults(data: Data, with key: UserDefaultsStorage.Key) {
        userDefaults.set(data, forKey: key.rawValue)
    }

    func dataFromUserDefaults(with key: UserDefaultsStorage.Key) -> Data? {
        return userDefaults.data(forKey: key.rawValue)
    }
}
