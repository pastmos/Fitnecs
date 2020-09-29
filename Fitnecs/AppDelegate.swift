//
//  AppDelegate.swift
//  Fitnecs
//
//  Created by Panov Sergey on 23.09.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var shared: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        startApp()
        
        return true
    }



}

private extension AppDelegate {
    func startApp() {
        appCoordinator = AppCoordinator(window: window)
        appCoordinator.start()
    }
}
