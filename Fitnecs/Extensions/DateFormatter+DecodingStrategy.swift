//
//  DateFormatter+DecodingStrategy.swift
//  VTBMobile
//
//  Created by Panov Sergey on 6/7/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Foundation


extension DateFormatter {

    static let iso8601: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
    static let iso8601noFS = ISO8601DateFormatter()
    static let iso8601noFSandZ: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
    static let iso8601_hotfix: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
        return formatter
    }()

    enum ISO8601Format {

        case iso8601, iso8601noFS, iso8601noFSandZ, iso8601_hotfix

    }

    func date(from string: String, with format: ISO8601Format = .iso8601) -> Date? {
        switch format {
        case .iso8601:
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            return formatter.date(from: string)

        case .iso8601noFS:
            return ISO8601DateFormatter().date(from: string)

        case .iso8601noFSandZ:
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            return formatter.date(from: string)

        case .iso8601_hotfix:
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
            return formatter.date(from: string)
        }
    }

}


extension JSONDecoder.DateDecodingStrategy {
    static let customISO8601 = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        let dateFormatter = DateFormatter()

        if let date = dateFormatter.date(from: string, with: .iso8601) ??
            dateFormatter.date(from: string, with: .iso8601noFS) ??
            dateFormatter.date(from: string, with: .iso8601noFSandZ) ??
            dateFormatter.date(from: string, with: .iso8601_hotfix) {
            return date
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
}


extension JSONEncoder.DateEncodingStrategy {
    static let customISO8601 = custom {
        var container = $1.singleValueContainer()
        try container.encode(DateFormatter.iso8601.string(from: $0))
    }
}
