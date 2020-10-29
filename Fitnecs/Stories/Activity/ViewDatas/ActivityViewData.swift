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
}

struct IntDataSample: Encodable {
    var value: Int
    var date: Date
}

struct DoubleDataSample: Encodable {
    var value: Double
    var date: Date
}




struct ActivityViewData {

    var steps: Double = 0
    var sleep: Double = 0
    var distance: Double = 0
    var activityIndex: Double = 0
    var activityPoints: Double = 0

}
