//
//  AppDelegate.swift
//  UniversitiesList-VIPER
//
//  Created by Ibrahim El-geddawy on 02/05/2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        goToUniversityList()
        return true
    }
    
    func goToUniversityList() {
        let universityModule = UniversityListRouter.createModule()
        let homeNav = UINavigationController(rootViewController: universityModule)
        self.window?.rootViewController = homeNav
    }

}

