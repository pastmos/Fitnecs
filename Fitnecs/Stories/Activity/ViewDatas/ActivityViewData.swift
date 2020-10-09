//
//  ActivityViewData.swift
//  Fitnecs
//
//  Created by Panov Sergey on 29.09.2020.
//

import UIKit
import Charts


class ActivityViewData {
    var height: String = ""
    var weight: String = ""
    var stepsToday: String = ""
    var activeEnergyBurned: [String] = ["", "", "", "", "", "", ""]
    var oxygenSaturation: [String] = ["", "", "", "", "", "", ""]
    var chartData: BarLineScatterCandleBubbleChartData?
}
