//
//  Double.swift
//  Fitnecs
//
//  Created by Panov Sergey on 15.10.2020.
//

import Foundation

extension Double {

    func roundTo(_ places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Double(Int(self * divisor)) / divisor
    }

}

