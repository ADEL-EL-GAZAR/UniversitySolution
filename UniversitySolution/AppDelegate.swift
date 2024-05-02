//
//  AppDelegate.swift
//  UniversitySolution
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureRealM()
        
        // Delay for splash screen (launch screen)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Adjust the delay time as needed
            self.showInitialViewController()
        }
        
        return true
    }
    
    func configureRealM() {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(
            schemaVersion: 1, // Increment this number whenever there's a schema change
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 1 {
                    // Perform migrations if needed, this block is empty if adding fields with default values
                    migration.enumerateObjects(ofType: University.className()) { oldObject, newObject in
                        // Assign a UUID for the new primary key field if it's newly added
                        newObject!["id"] = UUID().uuidString
                    }
                }
            })
    }
    
    func showInitialViewController() {
        // Instantiate UniversitySearchViewController from the XIB file
        let initialViewController = UniversitySearchRouter.createModule()
        let navigationController = UINavigationController(rootViewController: initialViewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

