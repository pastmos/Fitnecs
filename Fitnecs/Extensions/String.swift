//
//  String+HTML.swift
//  VTBMobile
//
//  Created by Panov Sergey on 7/5/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import Foundation

extension String {

    var htmlToAttributedString: NSAttributedString {
        guard let data = data(using: .utf8) else {
            return NSAttributedString()

        }
        do {
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        }
        catch {
            return NSAttributedString()
        }
    }

    var htmlToString: String {
        return htmlToAttributedString.string
    }


    var date: Date? {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: self)
    }
}
