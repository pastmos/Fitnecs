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



    // MARK: Initializers

    init(geofencingService: GeofencingServiceProtocol = GeofencingService()) {
        self.geofencingService = geofencingService
    }

    func start(from: UIViewController) {

        self.geofencingService.locationManager.delegate = self

        addRegionMonitorPoints()
    }

    private func addRegionMonitorPoints() {

        //0 километр
        let lattitude = CLLocationDegrees(55.75582509134279)
        let longitude = CLLocationDegrees(37.61771221201922)

//        //Азбука
//        let lattitude = CLLocationDegrees(55.99760912877097)
//        let longitude = CLLocationDegrees(37.236750113246444)
        let regionCenter = CLLocationCoordinate2D(latitude: lattitude, longitude: longitude)
        geofencingService.monitorRegionAtLocation(center: regionCenter, identifier: "Азбука Вкуса")
    }

    private func showLocalNotification(zone: String, isEnter: Bool) {

        let content = UNMutableNotificationContent()

        content.title = "Поздравляем!"
        content.subtitle = ""
        content.body = isEnter ? "Вы вошли в зону \(zone)" : "Вы вышли из зоны \(zone)"
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
        print("Entered the region!")
        showLocalNotification(zone: region.identifier, isEnter: true)
        let data = AlertViewData(title: "Поздравляем!", text: "Вы вошли в зону \(region.identifier)", closeButtonTitle: "OK")
        coordinatorDelegate?.showInfoAlert(with: data)
    }

    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Exit the region!")
        showLocalNotification(zone: region.identifier, isEnter: false)
        let data = AlertViewData(title: "Поздравляем!", text: "Вы вышли из зоны \(region.identifier)", closeButtonTitle: "OK")
        coordinatorDelegate?.showInfoAlert(with: data)
    }

}

enum GeofenceEnterType {
    case enter
    case exit
}
