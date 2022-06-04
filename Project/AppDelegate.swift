//
//  AppDelegate.swift
//  Project
//
//  Created by Asma hassan on 10/31/21.
//  Copyright © 2021 Asma hassan. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate  {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        CoreDataManager.shared.load()
        
        FirebaseApp.configure()
//
        if #available(iOS 13.0, *) {
            self.window?.overrideUserInterfaceStyle = .light
        }
      
    //        self.window = UIWindow(frame: UIScreen.main.bounds)
//        var nav: UINavigationController?
//        let isLogin = UserDefaults.standard.bool(forKey: "isLogin")
////
////     var nav: UINavigationController?
////        let isLogin = UserDefaults.standard.bool(forKey: "isLogin")
//        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Where "Main" is the storyboard file name
//        if isLogin {
//            guard let vc = storyboard.instantiateViewController(identifier: "LanguagesViewController") as? LanguagesViewController
//            else { return true}
//            nav = UINavigationController(rootViewController: vc)
//        } else {
//            guard let vc = storyboard.instantiateViewController(identifier: "StartViewController") as? StartViewController
//            else { return true}
//            nav = UINavigationController(rootViewController: vc)
//        }
//        nav?.isNavigationBarHidden = true
////        DarkModeConfiguration.instance.changeToLightMode()
//        self.window?.rootViewController = nav
//        self.window?.makeKeyAndVisible()

        return true
    }

    
    
    
    // MARK: UISceneSession Lifecycle
    
    //    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    ////        return GIDSignIn.sharedInstance.handle(url)
    //    }
    //
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

