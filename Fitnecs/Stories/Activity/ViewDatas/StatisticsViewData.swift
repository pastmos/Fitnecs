//
//  StatisticsViewData.swift
//  Fitnecs
//
//  Created by Panov Sergey on 19.10.2020.
//

import UIKit
import Charts


struct StatisticsViewData {

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

    var chart: ChartStatisticsViewData = ChartStatisticsViewData()



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


struct ChartStatisticsViewData {
    var activeEnergyBurnedChartData: BarLineScatterCandleBubbleChartData?
    var oxygenSaturationChartData: BarLineScatterCandleBubbleChartData?
    var bloodPressureSystolic: BarLineScatterCandleBubbleChartData?
    var heartRateChartData: BarLineScatterCandleBubbleChartData?
    var sleepHoursChartData: BarLineScatterCandleBubbleChartData?
    var distanceWalkChartData: BarLineScatterCandleBubbleChartData?
    var stepsChartData: BarLineScatterCandleBubbleChartData?
}
