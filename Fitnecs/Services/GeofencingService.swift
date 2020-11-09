//
//  GeofencingService.swift
//  Fitnecs
//
//  Created by Panov Sergey on 09.11.2020.
//

import CoreLocation

protocol GeofencingServiceProtocol {
    func monitorRegionAtLocation(center: CLLocationCoordinate2D, identifier: String )
}


class GeofencingService: GeofencingServiceProtocol {

    var locationManager: CLLocationManager = CLLocationManager()

    func monitorRegionAtLocation(center: CLLocationCoordinate2D, identifier: String ) {

        // Make sure the app is authorized.
        if CLLocationManager.authorizationStatus() == .authorizedAlways {

            // Make sure region monitoring is supported.
            if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {

                // Register the region.
                let maxDistance = self.locationManager.maximumRegionMonitoringDistance
                let region = CLCircularRegion(center: center,
                                              radius: maxDistance, identifier: identifier)
                region.notifyOnEntry = true
                region.notifyOnExit = true

                self.locationManager.startMonitoring(for: region)
            }
        }
    }
}
