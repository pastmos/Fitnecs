//
//  UIApplication.swift
//  Fitnecs
//
//  Created by Panov Sergey on 15.12.2020.
//  Copyright © 2020 Sergey Panov. All rights reserved.
//

import UIKit

extension UIApplication {
    static var hasTopNotch: Bool {
        return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
    }
}
