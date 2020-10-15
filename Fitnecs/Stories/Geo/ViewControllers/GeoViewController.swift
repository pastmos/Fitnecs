//
//  GeoViewController.swift
//  Fitnecs
//
//  Created by Panov Sergey on 28.09.2020.
//

import UIKit
import GoogleMaps


// MARK: - GeoViewController

class GeoViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var googleMapView: GMSMapView!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!

    let locationManager = CLLocationManager()

    var viewModel: GeoViewModelProtocol?


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        googleMapView.delegate = self

        if CLLocationManager.locationServicesEnabled() {
            initLocationManager()
        }
        initGoogleMap()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let camera = GMSCameraPosition.camera(withLatitude: (self.viewModel?.currentLocation?.latitude ?? 0), longitude:(self.viewModel?.currentLocation?.longitude ?? 0), zoom: 15)
            self.googleMapView.animate(to: camera)
        }

        viewModel?.start()
    }

    func initLocationManager() {
        locationManager.delegate = self
        locationManager.showsBackgroundLocationIndicator = true
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters//kCLLocationAccuracyNearestTenMeters
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false   // Remove later!
        //locationManager.startMonitoringSignificantLocationChanges()
        //locationManager.startMonitoringVisits()
        locationManager.startUpdatingLocation()
    }

    func initGoogleMap() {
        googleMapView.isMyLocationEnabled = true
        googleMapView.settings.myLocationButton = true
    }
}


extension GeoViewController: CLLocationManagerDelegate {
    //Keep track of user movement
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        viewModel?.currentLocation = manager.location!.coordinate

        if let location = viewModel?.currentLocation {
            latitudeLabel.text = "Широта" + ":  " + String(describing: location.latitude)
            longitudeLabel.text = "Долгота" + ":  " + String(describing: location.longitude)
            print("locations = \(location.latitude) \(location.longitude)")
        }
        //manager.stopUpdatingLocation()
    }
}

extension GeoViewController: GMSMapViewDelegate {

}
