//
//  AppDelegate.swift
//  Fitnecs
//
//  Created by Panov Sergey on 23.09.2020.
//

import UIKit
import GoogleMaps
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var shared: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        GMSServices.provideAPIKey(Environment.googleApiKey)
        FirebaseApp.configure()

        UNUserNotificationCenter.current().delegate = self

        startApp()

        return true
    }


}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(.alert)
    }
}

private extension AppDelegate {
    func startApp() {
        appCoordinator = AppCoordinator(window: window)
        appCoordinator.start()
    }
}
