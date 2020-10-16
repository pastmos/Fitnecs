//
//  ActivityViewData.swift
//  Fitnecs
//
//  Created by Panov Sergey on 29.09.2020.
//

import UIKit
import Charts


struct ActivityViewData {
    var height: Double = 0 {
        didSet {
            chart.height = String(describing: height)
        }
    }
    var weight: Double = 0 {
       didSet {
           chart.weight = String(describing: weight)
       }
   }
    var stepsToday: Int = 0 {
        didSet {
            chart.stepsToday = String(describing: stepsToday)
        }
    }
    var weekSteps: [Int] = [0,0,0,0,0,0,0] {
        didSet {
            chart.stepsChartData = createBarsArr(array: weekSteps.map{Double($0)})
        }
    }
    var activeEnergyBurned: [Int] = [0,0,0,0,0,0,0] {
       didSet {
        chart.activeEnergyBurnedChartData = createBarsArr(array: activeEnergyBurned.map{Double($0)})
       }
   }
    var oxygenSaturation: [Int] = [0,0,0,0,0,0,0] {
        didSet {
            chart.oxygenSaturationChartData = createBarsArr(array: oxygenSaturation.map{Double($0)})
        }
    }
    var bloodPressureSystolic: [Int] = [0,0,0,0,0,0,0] {
        didSet {
            chart.bloodPressureSystolic = createBarsArr(array: bloodPressureSystolic.map{Double($0)})
        }
    }
    var heartRate: [Int] = [0,0,0,0,0,0,0] {
        didSet {
            chart.heartRateChartData = createBarsArr(array: heartRate.map{Double($0)})
        }
    }
    var sleepHours: [Double] = [0,0,0,0,0,0,0] {
        didSet {
            chart.sleepHoursChartData = createBarsArr(array: sleepHours)
        }
    }
    var distanceWalk: [Double] = [0,0,0,0,0,0,0] {
        didSet {
            chart.distanceWalkChartData = createBarsArr(array: distanceWalk)
        }
    }

    var chart: ChartActivityViewData = ChartActivityViewData()



    private func createBarsArr(array: [Double]) -> BarLineScatterCandleBubbleChartData {
        var dataEntries: [BarChartDataEntry] = []

        for i in 0..<array.count {
            let dataEntry = BarChartDataEntry(x: Double(i+1), y: array[array.count - i - 1])
          dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Количество шагов в день")
        let chartData = BarChartData(dataSet: chartDataSet)
        return chartData
    }
}


struct ChartActivityViewData {
    var height: String = ""
    var weight: String = ""
    var stepsToday: String = ""
    var activeEnergyBurnedChartData: BarLineScatterCandleBubbleChartData?
    var oxygenSaturationChartData: BarLineScatterCandleBubbleChartData?
    var bloodPressureSystolic: BarLineScatterCandleBubbleChartData?
    var heartRateChartData: BarLineScatterCandleBubbleChartData?
    var sleepHoursChartData: BarLineScatterCandleBubbleChartData?
    var distanceWalkChartData: BarLineScatterCandleBubbleChartData?
    var stepsChartData: BarLineScatterCandleBubbleChartData?
}
