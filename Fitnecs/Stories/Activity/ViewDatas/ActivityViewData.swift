//
//  ActivityViewData.swift
//  Fitnecs
//
//  Created by Panov Sergey on 29.09.2020.
//

import UIKit
import Charts


struct ActivityData {
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

struct IntDataSample {
    var value: Int
    var date: Date
}

struct DoubleDataSample {
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
