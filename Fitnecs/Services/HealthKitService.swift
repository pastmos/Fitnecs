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
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!
        ]
        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { (_, _) in
            print("authorised???")
        }

        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { (bool, error) in
            if let e = error {
                print("oops something went wrong during authorisation \(e.localizedDescription)")
                completion(false)
            } else {
                print("User has completed the authorization flow")
                completion(true)
            }
        }
    }


    //Steps
    func getStepCount(startDate: Date, endDate: Date, startOrder: Int, completion: @escaping (Double?, Error?)->()) {

        //   Define the sample type
        let sampleType = HKQuantityType.quantityType(
            forIdentifier: HKQuantityTypeIdentifier.stepCount)

        //  Set the predicate
        let predicate = HKQuery.predicateForSamples(withStart: startDate,
                                                    end: endDate, options: [])
        // build the query
        let sampleQuery = HKStatisticsQuery(quantityType: sampleType!,
                                            quantitySamplePredicate: predicate,
                                            options: .cumulativeSum) { query, results, error in

            if results != nil {
                let quantity = results?.sumQuantity()
                let unit = HKUnit.count()
                let totalSteps = quantity?.doubleValue(for: unit)
                completion(totalSteps, error)
                print("totalSteps for \(endDate) are \(totalSteps!)")
            } else {
                completion(nil, error)
                print("results are nil")
                return
            }
        }
        // execute the Query
        healthStore.execute(sampleQuery)
    }


    //Sleep
    func getSleep(startDate: Date, endDate: Date, startOrder: Int, completion: @escaping (Double?, Error?)->()) {

        if let sleepType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis) {

                // Use a sortDescriptor to get the recent data first
                let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)

                // we create our query with a block completion to execute
                let query = HKSampleQuery(sampleType: sleepType, predicate: nil, limit: 30, sortDescriptors: [sortDescriptor]) { (query, tmpResult, error) -> Void in

                    if error != nil {

                        // something happened
                        return

                    }

                    if let result = tmpResult {

                        // do something with my data
                        for item in result {
                            if let sample = item as? HKCategorySample {
                                let value = (sample.value == HKCategoryValueSleepAnalysis.inBed.rawValue) ? "InBed" : "Asleep"
                                print("Healthkit sleep: \(sample.startDate) \(sample.endDate) - value: \(value)")
                            }
                        }
                    }
                }

                // finally, we execute our query
            healthStore.execute(query)
            }
    }


    //Height
    func getHeight(completion: @escaping (Double?, Error?)->()) {

        let heightType = HKQuantityType.quantityType(
            forIdentifier: HKQuantityTypeIdentifier.height)!

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)

        let query = HKSampleQuery(sampleType: heightType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, results, error) in
            if let result = results?.first as? HKQuantitySample{
                completion(result.quantity.doubleValue(for: HKUnit.meter()), error)
            }else{
                print("OOPS didnt get height \nResults => \(results), error => \(error)")
            }
        }
        self.healthStore.execute(query)
    }


    //Weight
    func getWeight(completion: @escaping (Double?, Error?)->()) {

        let heightType = HKQuantityType.quantityType(
            forIdentifier: HKQuantityTypeIdentifier.bodyMass)!

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)

        let query = HKSampleQuery(sampleType: heightType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, results, error) in
            if let result = results?.first as? HKQuantitySample{
                completion(result.quantity.doubleValue(for: HKUnit.gram()), error)
            }else{
                print("OOPS didnt get weight \nResults => \(results), error => \(error)")
            }
        }
        self.healthStore.execute(query)
    }


}
