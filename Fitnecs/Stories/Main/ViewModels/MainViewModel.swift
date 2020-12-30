//
//  MainViewModel.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 6/14/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit
import CoreLocation


protocol MainViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: MainViewModelCoordinatorDelegate? { get set }


    // MARK: Events

    func start(from: UIViewController)
}


protocol MainViewModelCoordinatorDelegate: ViewModelCoordinatorDelegate {
    func close(from controller: UIViewController)
}


class MainViewModel: NSObject, MainViewModelProtocol {

    var userModel: UserModel?

    // MARK: Delegates

    weak var coordinatorDelegate: MainViewModelCoordinatorDelegate?

    var regions: [GeofenceRegion] = []

    // MARK: Initializers

    init(geofencingService: GeofencingServiceProtocol = GeofencingService()) {
        self.geofencingService = geofencingService
    }

    func start(from: UIViewController) {

        self.geofencingService.locationManager.delegate = self

        addRegionMonitorPoints()
    }

    private func addRegionMonitorPoints() {

//Our test regions
        regions = [
            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.633206), longitude: CLLocationDegrees(37.603389)), identifier: "Жени."),
            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.791721), longitude: CLLocationDegrees(37.258575)), identifier: "Дениса."),
            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.997609), longitude: CLLocationDegrees(37.236750)), identifier: "Азбука Вкуса."),
            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.755825), longitude: CLLocationDegrees(37.617712)), identifier: "Нулевой километр.")
        ]

//Subway regions
//        regions = [
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.73512), longitude: CLLocationDegrees(37.59328)), identifier: "Парк культуры"),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.729), longitude: CLLocationDegrees(37.61139)), identifier: "Октябрьская"),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.72886), longitude: CLLocationDegrees(37.62356)), identifier: "Добрынинская"),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.7313), longitude: CLLocationDegrees(37.63612)), identifier: "Павелецкая"),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.74255), longitude: CLLocationDegrees(37.65389)), identifier: "Таганская"),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.75848), longitude: CLLocationDegrees(37.65985)), identifier: "Курская"),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.77717), longitude: CLLocationDegrees(37.655689)), identifier: "Комсомольская"),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.781196), longitude: CLLocationDegrees(37.633529)), identifier: "Проспект Мира"),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.77921), longitude: CLLocationDegrees(37.6009)), identifier: "Новослободская"),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.77492), longitude: CLLocationDegrees(37.58207)), identifier: "Белорусская"),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.760109), longitude: CLLocationDegrees(37.577141)), identifier: "Краснопресненская"),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.74388), longitude: CLLocationDegrees(37.56673)), identifier: "Киевская"),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.71886), longitude: CLLocationDegrees(37.60797)), identifier: "Шаболовская"),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.70818), longitude: CLLocationDegrees(37.58742)), identifier: "Ленинский проспект"),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.75876), longitude: CLLocationDegrees(37.62573)), identifier: "Лубянка"),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.76426), longitude: CLLocationDegrees(37.6389)), identifier: "Чистые пруды")
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.755825), longitude: CLLocationDegrees(37.617712)), identifier: ""),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.755825), longitude: CLLocationDegrees(37.617712)), identifier: ""),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.755825), longitude: CLLocationDegrees(37.617712)), identifier: ""),
//            GeofenceRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(55.755825), longitude: CLLocationDegrees(37.617712)), identifier: "")
//            ]


        regions.forEach { region in
            geofencingService.monitorRegionAtLocation(center: region.center, identifier: region.identifier)
        }
    }

    private func showLocalNotification(zone: String, isEnter: Bool) {

        let content = UNMutableNotificationContent()

        content.title = "Поздравляем!"
        content.subtitle = ""
        content.body = isEnter ? "Вход в зону \(zone)" : "Выход из зоны \(zone)"
        content.badge = 1

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "SimplifiedIOSNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

    // MARK: Private
    private let geofencingService: GeofencingServiceProtocol

}


extension MainViewModel: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        let latitude = manager.location!.coordinate.latitude
        let longitude = manager.location!.coordinate.longitude

        let userLocation2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        guard let regionCenter2D = self.regions.filter({ $0.identifier == region.identifier }).first?.center else {
            return
        }

        let userLocation: CLLocation = CLLocation(latitude: userLocation2D.latitude, longitude: userLocation2D.longitude)
        let regionCenter: CLLocation = CLLocation(latitude: regionCenter2D.latitude, longitude: regionCenter2D.longitude)

        let distance = Int(regionCenter.distance(from: userLocation))

        let distanceStr = "До центра: " + String(distance) + " м"
        let coordinatesStr = "Ш: " + String(latitude) + " Д: " + String(longitude) + ". "
        showLocalNotification(zone: region.identifier + " " + coordinatesStr + distanceStr, isEnter: true)
    }

    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        let latitude = manager.location!.coordinate.latitude
        let longitude = manager.location!.coordinate.longitude

        let userLocation2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        guard let regionCenter2D = self.regions.filter({ $0.identifier == region.identifier }).first?.center else {
            return
        }

        let userLocation: CLLocation = CLLocation(latitude: userLocation2D.latitude, longitude: userLocation2D.longitude)
        let regionCenter: CLLocation = CLLocation(latitude: regionCenter2D.latitude, longitude: regionCenter2D.longitude)

        let distance = Int(regionCenter.distance(from: userLocation))

        let distanceStr = "До центра: " + String(distance) + " м"
        let coordinatesStr = "Широта: " + String(latitude) + " Долгота: " + String(longitude) + ". "
        showLocalNotification(zone: region.identifier + " " + coordinatesStr + distanceStr, isEnter: true)
    }

}

enum GeofenceEnterType {
    case enter
    case exit
}


struct GeofenceRegion {
    var center: CLLocationCoordinate2D
    var identifier: String
}
