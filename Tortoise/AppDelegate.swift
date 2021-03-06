//
//  AppDelegate.swift
//  Tortoise
//
//  Created by Jordan Donald on 6/19/16.
//  Copyright © 2016 Jordan Donald. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var authorizationNavigationController:UINavigationController?
    var tableNavigationController: UINavigationController?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //PERSISTENCE
        //let userIsLoggedIn = NSUserDefaults.standardUserDefaults().objectForKey("userIdLoggedIn")
        
        let landingViewController = LandingViewController(nibName: "LandingViewController", bundle:nil)
        self.authorizationNavigationController = UINavigationController(rootViewController: landingViewController)
        self.window?.makeKeyAndVisible()
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let myReadingsViewController = MyReadingsViewController(nibName: "MyReadingsViewController", bundle:nil)
        self.tableNavigationController = UINavigationController(rootViewController: myReadingsViewController)
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        //Change the rootview to bypass the login page
        self.window?.rootViewController = self.authorizationNavigationController
        self.window?.makeKeyAndVisible()
        self.authorizationNavigationController?.navigationBarHidden = true
        
//        if let _ = userIsLoggedIn {
//            
//            self.window?.rootViewController = self.tableNavigationController
//            
//        } else {
//            
//            self.window?.rootViewController = self.authorizationNavigationController
//        }
//        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func navigateToTable() {
        
        self.window?.rootViewController = self.tableNavigationController
        
    }
    
    func navigateToAuth() {
        
        let landingViewController = LandingViewController(nibName: "LandingViewController", bundle:nil)
        self.authorizationNavigationController = UINavigationController(rootViewController: landingViewController)
        
        self.window?.rootViewController = self.authorizationNavigationController
        
    }



}

