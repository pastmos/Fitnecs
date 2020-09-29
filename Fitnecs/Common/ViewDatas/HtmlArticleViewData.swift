//
//  HtmlArticleViewData.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 7/6/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit

protocol HtmlArticleViewDataType {
    var title: String { get }
    var text: NSAttributedString { get }
}

struct HtmlArticleViewData: HtmlArticleViewDataType {
    struct Config {
        let textColor: UIColor

        static let `default` = Config(textColor: Assets.Colors.Style.dark.color)
        static let offer = Config(textColor: Assets.Colors.Style.dark.color)
    }

    // MARK: HtmlArticleViewDataType

    var text: NSAttributedString {
        guard let path = Bundle.main.path(forResource: "HtmlArticleTemplate", ofType: "html") else {
            return plainText.htmlToAttributedString
        }

        var template = (try? String(contentsOfFile: path, encoding: .utf8))
        template = template?.replacingOccurrences(of: "[[[description]]]", with: plainText)
        //template = template?.replacingOccurrences(of: "&lt;meta charset=\"utf-8\"&gt;", with: plainText)

        let text = NSMutableAttributedString(attributedString: (template ?? plainText).htmlToAttributedString)
        text.addAttributes([.foregroundColor: config.textColor],
                           range: NSRange(location: 0, length: text.length))

        return text
    }

    // MARK: Initializers

    init(title: String, text: String, config: Config = .default) {
        self.title = title
        plainText = text
        self.config = config
    }

    // MARK: Private

    let title: String
    private let plainText: String
    private let config: Config
}

enum HtmlArticleViewDataState {
    case normal, loading, error(viewData: ErrorViewDataType)
}
