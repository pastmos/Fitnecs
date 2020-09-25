//
//  String+HTML.swift
//  VTBMobile
//
//  Created by Evgeniy Mikholap on 7/5/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
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

}
