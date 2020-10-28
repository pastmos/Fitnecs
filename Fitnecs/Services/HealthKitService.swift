//
//  HealthKitService.swift
//  Fitnecs
//
//  Created by Panov Sergey on 29.09.2020.
//

import UIKit
import HealthKit

protocol HealthKitServiceProtocol {
    func authoriseHealthKitAccess(_ completion: @escaping (Bool) -> ())

    //Old version support
    func getStepCount(startDate: Date, endDate: Date, completion: @escaping (Double)->())
    func getDailyDistance(startDate: Date, endDate: Date, completion: @escaping (Double)->())
    func getSleep(startDate: Date, endDate: Date, limit: Int, completion: @escaping ([HKSample]?, HKUnit) -> ())
    //-------------------

    func getStepCount(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ())
    func getDistanceWalkingRunning(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ())
    func getActiveEnergyBurned(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ())
    func getOxygenSaturation(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ())
    func getBodyMassIndex(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ())
    func getBloodPressureSystolic(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ())
    func getBloodPressureDiastolic(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ())
    func getHeight(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ())
    func getBodyMass(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ())
    func getHeartRate(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ())
    func getFlightsClimbed(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ())
    func getSleepAnalysis(startDate: Date, endDate: Date, completion: @escaping ([HKCategorySample], HKUnit) -> ())
}


class HealthKitService: HealthKitServiceProtocol {

    let healthStore = HKHealthStore()


//Authorize
    func authoriseHealthKitAccess(_ completion: @escaping (Bool) -> ()){

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

        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { (bool, error) in
            if let e = error {
                print("HealthKit auth failed \(e.localizedDescription)")
                completion(false)
            } else {
                print("HealthKit auth success")
                completion(true)
            }
        }
    }


// Old version support -------
    //Steps
        func getStepCount(startDate: Date, endDate: Date, completion: @escaping (Double)->()) {
            statisticsQuery(startDate: startDate, endDate: endDate, type: .stepCount) { total in
                completion(total)
            }
        }

        //Distance
        func getDailyDistance(startDate: Date, endDate: Date, completion: @escaping (Double)->()) {
            statisticsQuery(startDate: startDate, endDate: endDate, type: .distanceWalkingRunning, unit: .meter()) { total in
                completion(total)
            }
        }

    //Sleep
       func getSleep(startDate: Date, endDate: Date, limit: Int = 100, completion: @escaping ([HKSample]?, HKUnit) -> ()) {
           sampleQueryCategory(startDate: startDate, endDate: endDate, type: .sleepAnalysis, unit: .minute()) { samples, unit in
               completion(samples, unit)
           }
       }

//----------------------------



    //Sample queries

    //StepCount
    func getStepCount(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ()) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .stepCount, unit: .count()) { samples, unit in
            completion(samples, unit)
        }
    }

    //DistanceWalkingRunning
    func getDistanceWalkingRunning(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ()) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .distanceWalkingRunning, unit: .meter()) { samples, unit in
            completion(samples, unit)
        }
    }

    //ActiveEnergyBurned
    func getActiveEnergyBurned(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ()) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .activeEnergyBurned, unit: .kilocalorie()) { samples, unit in
            completion(samples, unit)
        }
    }


    //OxygenSaturation
    func getOxygenSaturation(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ()) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .oxygenSaturation, unit: .percent()) { samples, unit in
            completion(samples, unit)
        }
    }

    //BodyMassIndex
    func getBodyMassIndex(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ()) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .bodyMassIndex, unit: .count()) { samples, unit in
            completion(samples, unit)
        }
    }

    //BloodPressureSystolic
    func getBloodPressureSystolic(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ()) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .bloodPressureSystolic, unit: .millimeterOfMercury()) { samples, unit in
            completion(samples, unit)
        }
    }

    //BloodPressureDiastolic
    func getBloodPressureDiastolic(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ()) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .bloodPressureDiastolic, unit: .millimeterOfMercury()) { samples, unit in
            completion(samples, unit)
        }
    }

    
    //Height
    func getHeight(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ()) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .height, unit: .meter()) { samples, unit in
            completion(samples, unit)
        }
    }


    //BodyMass
    func getBodyMass(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ()) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .bodyMass, unit: .gram()) { samples, unit in
            completion(samples, unit)
        }
    }

    //HeartRate
    func getHeartRate(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ()) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .heartRate, unit: HKUnit(from: "count/min")) { samples, unit in
            completion(samples, unit)
        }
    }

    //FlightsClimbed
    func getFlightsClimbed(startDate: Date, endDate: Date, completion: @escaping ([HKQuantitySample], HKUnit) -> ()) {
        sampleQuery(startDate: startDate, endDate: endDate, type: .flightsClimbed, unit: .count()) { samples, unit in
            completion(samples, unit)
        }
    }


    //SleepAnalysis
    func getSleepAnalysis(startDate: Date, endDate: Date, completion: @escaping ([HKCategorySample], HKUnit) -> ()) {
        sampleQueryCategory(startDate: startDate, endDate: endDate, type: .sleepAnalysis, unit: .minute()) { samples, unit in
            completion(samples, unit)
        }
    }





    //Basic funcs

    func statisticsQuery(startDate: Date? = nil, endDate: Date? = nil, type: HKQuantityTypeIdentifier, unit: HKUnit = .count(), options: HKStatisticsOptions = .cumulativeSum, completion: @escaping (Double)->()) {
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


    func sampleQuery(startDate: Date? = nil, endDate: Date? = nil, type: HKQuantityTypeIdentifier, unit: HKUnit, limit: Int = 1000, completion: @escaping ([HKQuantitySample], HKUnit)->()) {
        let type = HKQuantityType.quantityType(forIdentifier: type)!

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)

        //  Set the predicate
        let predicate = ((startDate != nil) && (endDate != nil)) ? HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: []) : nil

        let query = HKSampleQuery(sampleType: type, predicate: predicate, limit: limit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let samples = samples as? [HKQuantitySample], !samples.isEmpty else {
                completion([], unit)
                return
            }
            completion(samples, unit)
        }
        self.healthStore.execute(query)
    }

    func sampleQueryCategory(startDate: Date? = nil, endDate: Date? = nil, type: HKCategoryTypeIdentifier, unit: HKUnit, limit: Int = 1000, completion: @escaping ([HKCategorySample], HKUnit)->()) {
        let type = HKCategoryType.categoryType(forIdentifier: type)!

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)

        //  Set the predicate
        let predicate = ((startDate != nil) && (endDate != nil)) ? HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: []) : nil

        let query = HKSampleQuery(sampleType: type, predicate: predicate, limit: limit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
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
