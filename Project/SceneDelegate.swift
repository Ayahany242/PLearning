//
//  SceneDelegate.swift
//  Project
//
//  Created by Asma hassan on 10/31/21.
//  Copyright © 2021 Asma hassan. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        var nav: UINavigationController?
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Where "Main" is the storyboard file name
        if isLogin {
            guard let vc = storyboard.instantiateViewController(identifier: "LanguagesViewController") as? LanguagesViewController
            else { return }
            nav = UINavigationController(rootViewController: vc)
        } else {
            guard let vc = storyboard.instantiateViewController(identifier: "StartViewController") as? StartViewController
            else { return }
            nav = UINavigationController(rootViewController: vc)
        }
        nav?.isNavigationBarHidden = true
        window = UIWindow(windowScene: windowScene)
        window?.frame = UIScreen.main.bounds
        //        let viewController: CitiesTableViewController = CitiesConfigurator.configure()
        window?.rootViewController = nav
        setupNavigationBarColors()
        window?.makeKeyAndVisible()
        (UIApplication.shared.delegate as? AppDelegate)?.window = window
    }
    
    func setupNavigationBarColors() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor.white
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.3249999881, green: 0.3449999988, blue: 0.8820000291, alpha: 1)
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.3249999881, green: 0.3449999988, blue: 0.8820000291, alpha: 1), NSAttributedString.Key.font: UIFont.appFontRegular(ofSize: 13)]
        addNavigationBarShadow()
    }
    
    func addNavigationBarShadow() {
        UINavigationBar.appearance().layer.shadowOffset = CGSize(width: 1, height: 1)
        UINavigationBar.appearance().layer.shadowColor = UIColor.black.cgColor
        UINavigationBar.appearance().layer.shadowOpacity = 1
        UINavigationBar.appearance().layer.shadowRadius = 5
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

