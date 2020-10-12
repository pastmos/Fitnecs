//
//  HealthKitService.swift
//  Fitnecs
//
//  Created by Panov Sergey on 29.09.2020.
//

import UIKit
import HealthKit


class HealthKitService {

    let healthStore = HKHealthStore()


//Authorize
    func authoriseHealthKitAccess(_ completion: @escaping (Bool) -> ()){

        let healthKitTypes: Set = [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.oxygenSaturation)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!,
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




//Statistics

    //Steps
    func getStepCount(startDate: Date, endDate: Date, startOrder: Int, completion: @escaping (Double)->()) {
        statisticsQuery(startDate: startDate, endDate: endDate, type: .stepCount, unit: .count()) { total in
            completion(total)
        }
    }

    //ActiveEnergyBurned
    func getActiveEnergyBurned(startDate: Date, endDate: Date, completion: @escaping (Double)->()) {
        statisticsQuery(startDate: startDate, endDate: endDate, type: .activeEnergyBurned, unit: .kilocalorie()) { total in
            completion(total)
        }
    }


    //OxygenSaturation
    func getOxygenSaturation(startDate: Date, endDate: Date, completion: @escaping (Double)->()) {
        statisticsQuery(startDate: startDate, endDate: endDate, type: .oxygenSaturation, unit: .percent(), options: .discreteAverage) { total in
            completion(total)
        }
    }


//Sample
    
    //Height
    func getHeight(completion: @escaping (Double)->()) {
        sampleQuery(type: .height, unit: .meter()) {
            result in
            completion(result)
        }
    }


    //Weight
    func getWeight(completion: @escaping (Double)->()) {
        sampleQuery(type: .bodyMass, unit: .gram()) {
            result in
            completion(result)
        }
    }

    //Sleep
    func getSleep(completion: @escaping ([HKCategorySample])->()) {
        sampleQueryCategory(type: .sleepAnalysis, limit: 7) { samples in
            samples.forEach { sample in
                print(sample)
            }
            completion(samples)
        }
    }





    //Basic funcs

    func statisticsQuery(startDate: Date?, endDate: Date?, type: HKQuantityTypeIdentifier, unit: HKUnit, options: HKStatisticsOptions = .cumulativeSum, completion: @escaping (Double)->()) {
        //   Define the sample type
        let sampleType = HKQuantityType.quantityType(
            forIdentifier: type)

        //  Set the predicate
        let predicate = HKQuery.predicateForSamples(withStart: startDate,
                                                    end: endDate, options: [])
        // build the query
        let sampleQuery = HKStatisticsQuery(quantityType: sampleType!,
                                            quantitySamplePredicate: predicate,
                                            options: options) { query, results, error in

            var quantity: HKQuantity?
            quantity = (options == .cumulativeSum) ? results?.sumQuantity() : results?.averageQuantity()

            let total = quantity?.doubleValue(for: unit)
            completion(total ?? 0)
        }
        healthStore.execute(sampleQuery)
    }


    func sampleQuery(type: HKQuantityTypeIdentifier, unit: HKUnit, limit: Int = 1, completion: @escaping (Double)->()) {
        let type = HKQuantityType.quantityType(
            forIdentifier: type)!

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)

        let query = HKSampleQuery(sampleType: type, predicate: nil, limit: limit, sortDescriptors: [sortDescriptor]) { (query, results, error) in
            if let result = results?.first as? HKQuantitySample{
                completion(result.quantity.doubleValue(for: unit))
            }else{
                completion(0)
            }
        }
        self.healthStore.execute(query)
    }


    func sampleQueryCategory(type: HKCategoryTypeIdentifier, limit: Int = 1, completion: @escaping ([HKCategorySample])->()) {

        var samples: [HKCategorySample] = []

        let type = HKObjectType.categoryType(forIdentifier: type)!

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)

        let query = HKSampleQuery(sampleType: type, predicate: nil, limit: limit, sortDescriptors: [sortDescriptor]) { (query, result, error) in
            if let result = result {
                for item in result {
                    if let sample = item as? HKCategorySample {
                        samples.append(sample)
                    }
                }
                completion(samples)
            }
        }
        self.healthStore.execute(query)
    }
}
