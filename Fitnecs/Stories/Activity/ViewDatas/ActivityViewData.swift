//
//  ActivityViewData.swift
//  Fitnecs
//
//  Created by Panov Sergey on 29.09.2020.
//

import UIKit
import Charts

protocol ActivityDataType {
    var distanceWalkingRunning: [IntDataSample] { get set }
    var stepCount: [IntDataSample] { get set }
    var flightsClimbed: [IntDataSample] { get set }
    var activeEnergyBurned: [DoubleDataSample] { get set }
    var oxygenSaturation: [DoubleDataSample] { get set }
    var height: [DoubleDataSample] { get set }
    var bodyMass: [DoubleDataSample] { get set }
    var bodyMassIndex: [DoubleDataSample] { get set }
    var heartRate: [IntDataSample] { get set }
    var bloodPressureSystolic: [IntDataSample] { get set }
    var bloodPressureDiastolic: [IntDataSample] { get set }
    var bodyTemperature: [DoubleDataSample] { get set }
    var sleepAnalysis: [IntDataSample] { get set }
    var source: Int { get set }
}

struct ActivityData: ActivityDataType, Encodable {
    var distanceWalkingRunning: [IntDataSample] = []
    var stepCount: [IntDataSample] = []
    var flightsClimbed: [IntDataSample] = []
    var activeEnergyBurned: [DoubleDataSample] = []
    var oxygenSaturation: [DoubleDataSample] = []
    var height: [DoubleDataSample] = []
    var bodyMass: [DoubleDataSample] = []
    var bodyMassIndex: [DoubleDataSample] = []
    var heartRate: [IntDataSample] = []
    var bloodPressureSystolic: [IntDataSample] = []
    var bloodPressureDiastolic: [IntDataSample] = []
    var bodyTemperature: [DoubleDataSample] = []
    var sleepAnalysis: [IntDataSample] = []
    var source: Int = 1

    private enum CodingKeys: String, CodingKey {
        case distanceWalkingRunning
        case stepCount
        case flightsClimbed
        case activeEnergyBurned
        case oxygenSaturation
        case height
        case bodyMass
        case bodyMassIndex
        case heartRate
        case bloodPressureSystolic
        case bloodPressureDiastolic
        case bodyTemperature
        case sleepAnalysis
        case source
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(distanceWalkingRunning, forKey: .distanceWalkingRunning)
        try container.encode(stepCount, forKey: .stepCount)
        try container.encode(flightsClimbed, forKey: .flightsClimbed)
        try container.encode(activeEnergyBurned, forKey: .activeEnergyBurned)
        try container.encode(oxygenSaturation, forKey: .oxygenSaturation)
        try container.encode(height, forKey: .height)
        try container.encode(bodyMass, forKey: .bodyMass)
        try container.encode(bodyMassIndex, forKey: .bodyMassIndex)
        try container.encode(heartRate, forKey: .heartRate)
        try container.encode(bloodPressureSystolic, forKey: .bloodPressureSystolic)
        try container.encode(bloodPressureDiastolic, forKey: .bloodPressureDiastolic)
        try container.encode(sleepAnalysis, forKey: .sleepAnalysis)
        try container.encode(source, forKey: .source)
    }
}

struct IntDataSample: Encodable {
    var value: Int
    var date: String

    private enum CodingKeys: String, CodingKey {
        case value
        case date
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encode(date, forKey: .date)
    }
}

struct DoubleDataSample: Encodable {
    var value: Double
    var date: String

    private enum CodingKeys: String, CodingKey {
        case value
        case date
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encode(date, forKey: .date)
    }
}




struct ActivityViewData {
    var sleepHours: Double = 0
    var kilometersItemData: ActivityItemViewData
    var stepsItemData:  ActivityItemViewData
    var caloriesItemData:  ActivityItemViewData
}

struct UserViewData {
    var avatarImage: UIImage = UIImage()
    var todayStatus: String = ""
    var normalStatus: String = ""
    var points: Int = 0
    var activityIndex: Double = 0
    var yesterdayActivityIndex: Double = 0
}

struct ChartViewData {
    var steps: [Int] = [0, 0, 0, 0, 0, 0, 0] {
        didSet {
            stepsChart = createBarsArr(array: steps.map { Double($0) }, type: .steps)
        }
    }
    var calories: [Int] = [0, 0, 0, 0, 0, 0, 0] {
        didSet {
            caloriesChart = createBarsArr(array: calories.map { Double($0) }, type: .calories)
        }
    }
    var distance: [Double] = [0, 0, 0, 0, 0, 0, 0] {
        didSet {
            distanceChart = createBarsArr(array: distance.map { Double($0) }, type: .distance)
        }
    }
    var stepsChart: BarLineScatterCandleBubbleChartData?
    var caloriesChart: BarLineScatterCandleBubbleChartData?
    var distanceChart: BarLineScatterCandleBubbleChartData?

    private func createBarsArr(array: [Double], type: ChartType) -> BarLineScatterCandleBubbleChartData {
        var dataEntries: [BarChartDataEntry] = []

        for i in 0..<array.count {
            let dataEntry = BarChartDataEntry(x: Double(i + 1), y: array[array.count - i - 1])
            dataEntries.append(dataEntry)
        }
        var description = ""
        switch type {
        case .steps:
            description = "Пройдено шагов в день"
        case .calories:
            description = "Потрачено калорий в день"
        case .distance:
            description = "Пройдено км в день"
        }
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: description)
        let chartData = BarChartData(dataSet: chartDataSet)
        return chartData
    }
}


enum ChartType {
    case steps
    case calories
    case distance
}
