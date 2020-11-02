//
//  HealthKitService.swift
//  Fitnecs
//
//  Created by Panov Sergey on 29.09.2020.
//

import UIKit
import HealthKit

protocol HealthKitServiceProtocol {
    func authoriseHealthKitAccess(_ completion: @escaping (Bool) -> Void)

    //Old version support
    func getStepCount(_ startDate: Date, _ endDate: Date, completion: @escaping (Double) -> Void)
    func getDailyDistance(_ startDate: Date, _ endDate: Date, completion: @escaping (Double) -> Void)
    func getSleep(_ startDate: Date, _ endDate: Date, limit: Int, completion: @escaping ([HKSample]?, HKUnit) -> Void)
    //-------------------

    func getStepCount(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void)
    func getDistanceWalkingRunning(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void)
    func getActiveEnergyBurned(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void)
    func getOxygenSaturation(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void)
    func getBodyMassIndex(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void)
    func getBloodPressureSystolic(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void)
    func getBloodPressureDiastolic(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void)
    func getHeight(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void)
    func getBodyMass(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void)
    func getHeartRate(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void)
    func getFlightsClimbed(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void)
    func getSleepAnalysis(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKCategorySample], HKUnit) -> Void)
}


class HealthKitService: HealthKitServiceProtocol {

    let healthStore = HKHealthStore()


//Authorize
    func authoriseHealthKitAccess(_ completion: @escaping (Bool) -> Void) {

        let healthKitTypes: Set = [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMassIndex)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.oxygenSaturation)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodPressureSystolic)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodPressureDiastolic)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyTemperature)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!,
            HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis)!
        ]

        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { bool, error in
            if let e = error {
                print("HealthKit auth failed \(e.localizedDescription)")
                completion(false)
            }
            else {
                print("HealthKit auth success")
                completion(true)
            }
        }
    }


// Old version support -------
    //Steps
        func getStepCount(_ startDate: Date, _ endDate: Date, completion: @escaping (Double) -> Void) {
            statisticsQuery(startDate: startDate, endDate: endDate, type: .stepCount) { total in
                completion(total)
            }
        }

        //Distance
        func getDailyDistance(_ startDate: Date, _ endDate: Date, completion: @escaping (Double) -> Void) {
            statisticsQuery(startDate: startDate, endDate: endDate, type: .distanceWalkingRunning, unit: .meter()) { total in
                completion(total)
            }
        }

    //Sleep
       func getSleep(_ startDate: Date, _ endDate: Date, limit: Int = 100, completion: @escaping ([HKSample]?, HKUnit) -> Void) {
           sampleQueryCategory(startDate: startDate, endDate: endDate, type: .sleepAnalysis, unit: .minute()) { samples, unit in
               completion(samples, unit)
           }
       }

//----------------------------



    //Sample queries

    //StepCount
    func getStepCount(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .stepCount, unit: .count()) { samples, unit in
            completion(samples, unit)
        }
    }

    //DistanceWalkingRunning
    func getDistanceWalkingRunning(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .distanceWalkingRunning, unit: .meter()) { samples, unit in
            completion(samples, unit)
        }
    }

    //ActiveEnergyBurned
    func getActiveEnergyBurned(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .activeEnergyBurned, unit: .kilocalorie()) { samples, unit in
            completion(samples, unit)
        }
    }


    //OxygenSaturation
    func getOxygenSaturation(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .oxygenSaturation, unit: .percent()) { samples, unit in
            completion(samples, unit)
        }
    }

    //BodyMassIndex
    func getBodyMassIndex(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .bodyMassIndex, unit: .count()) { samples, unit in
            completion(samples, unit)
        }
    }

    //BloodPressureSystolic
    func getBloodPressureSystolic(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .bloodPressureSystolic, unit: .millimeterOfMercury()) { samples, unit in
            completion(samples, unit)
        }
    }

    //BloodPressureDiastolic
    func getBloodPressureDiastolic(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .bloodPressureDiastolic, unit: .millimeterOfMercury()) { samples, unit in
            completion(samples, unit)
        }
    }

    //Height
    func getHeight(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .height, unit: .meter()) { samples, unit in
            completion(samples, unit)
        }
    }


    //BodyMass
    func getBodyMass(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .bodyMass, unit: .gram()) { samples, unit in
            completion(samples, unit)
        }
    }

    //HeartRate
    func getHeartRate(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .heartRate, unit: HKUnit(from: "count/min")) { samples, unit in
            completion(samples, unit)
        }
    }

    //FlightsClimbed
    func getFlightsClimbed(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> Void) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .flightsClimbed, unit: .count()) { samples, unit in
            completion(samples, unit)
        }
    }


    //SleepAnalysis
    func getSleepAnalysis(_ startDate: Date, _ endDate: Date, completion: @escaping ([HKCategorySample], HKUnit) -> Void) {
        sampleQueryCategory(startDate: startDate, endDate: endDate, type: .sleepAnalysis, unit: .minute()) { samples, unit in
            completion(samples, unit)
        }
    }





    //Basic funcs

    func statisticsQuery(startDate: Date? = nil, endDate: Date? = nil, type: HKQuantityTypeIdentifier, unit: HKUnit = .count(), options: HKStatisticsOptions = .cumulativeSum, completion: @escaping (Double) -> Void) {
        //   Define the sample type
        let type = HKQuantityType.quantityType(
            forIdentifier: type)

        //  Set the predicate
        let predicate = HKQuery.predicateForSamples(withStart: startDate,
                                                    end: endDate, options: [])
        // build the query
        let sampleQuery = HKStatisticsQuery(quantityType: type!,
                                            quantitySamplePredicate: predicate,
                                            options: options) { query, results, error in

            var quantity: HKQuantity?
            quantity = (options == .cumulativeSum) ? results?.sumQuantity() : results?.averageQuantity()

            let total = quantity?.doubleValue(for: unit)
            completion(total ?? 0)
        }
        healthStore.execute(sampleQuery)
    }


    func sampleQuery(startDate: Date? = nil, endDate: Date? = nil, type: HKQuantityTypeIdentifier, unit: HKUnit, limit: Int = 1000, completion: @escaping ([HKQuantitySample], HKUnit) -> Void) {
        let type = HKQuantityType.quantityType(forIdentifier: type)!

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)

        //  Set the predicate
        let predicate = ((startDate != nil) && (endDate != nil)) ? HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: []) : nil

        let query = HKSampleQuery(sampleType: type, predicate: predicate, limit: limit, sortDescriptors: [sortDescriptor]) { query, samples, error in
            guard let samples = samples as? [HKQuantitySample], !samples.isEmpty else {
                completion([], unit)
                return
            }
            completion(samples, unit)
        }
        self.healthStore.execute(query)
    }

    func sampleQueryCategory(startDate: Date? = nil, endDate: Date? = nil, type: HKCategoryTypeIdentifier, unit: HKUnit, limit: Int = 1000, completion: @escaping ([HKCategorySample], HKUnit) -> Void) {
        let type = HKCategoryType.categoryType(forIdentifier: type)!

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)

        //  Set the predicate
        let predicate = ((startDate != nil) && (endDate != nil)) ? HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: []) : nil

        let query = HKSampleQuery(sampleType: type, predicate: predicate, limit: limit, sortDescriptors: [sortDescriptor]) { query, samples, error in
            guard let samples = samples as? [HKCategorySample], !samples.isEmpty else {
                completion([], unit)
                return
            }
            completion(samples, unit)
        }
        self.healthStore.execute(query)
    }



//    func sampleQueryCategory(startDate: Date? = nil, endDate: Date? = nil, type: HKCategoryTypeIdentifier, unit: HKUnit, limit: Int = 1, completion: @escaping ([HKSample]?, HKUnit)->()) {
//
//        var samples: [HKCategorySample] = []
//
//        let type = HKObjectType.categoryType(forIdentifier: type)!
//
//        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
//
//        let query = HKSampleQuery(sampleType: type, predicate: nil, limit: limit, sortDescriptors: [sortDescriptor]) { (query, result, error) in
//            if let result = result {
//                for item in result {
//                    if let sample = item as? HKCategorySample {
//                        samples.append(sample)
//                    }
//                }
//                completion(samples, unit)
//            }
//        }
//        self.healthStore.execute(query)
//    }
}
