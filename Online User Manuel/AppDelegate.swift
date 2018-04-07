//
//  AppDelegate.swift
//  Online User Manuel
//
//  Created by seda üzüm on 2.04.2018.
//  Copyright © 2018 uzum & asıliskender. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let nav1 = UINavigationController()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vehicleTypeVC = storyboard.instantiateViewController(withIdentifier: "VehicleTypeViewController") as! VehicleTypeViewController
        
        nav1.viewControllers = [vehicleTypeVC]
        self.window!.rootViewController = nav1
        self.window?.makeKeyAndVisible()
        
        return true
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
