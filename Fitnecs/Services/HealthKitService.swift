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

    func getStepCount(startDate: Date, endDate: Date, completion: @escaping (Double?, Error?)->()) {

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
}