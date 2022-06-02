//
//  TabBarViewController.swift
//  Project
//
//  Created by Afnan MacBook Pro on 31/05/2022.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    @IBOutlet weak var videosTabBarItem: UITabBarItem!
    @IBOutlet weak var exampleTabBarItem: UITabBarItem!
    @IBOutlet weak var notesTabBarItem: UITabBarItem!
    @IBOutlet weak var settingsTabBarItem: UITabBarItem!
    
//    @IBOutlet var tabbarItems: [UITabBarItem]!
    var language: Language?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hidesBottomBarWhenPushed = true
        self.delegate = self
        (viewControllers?.first as? VideosViewController)?.language = language
        //        self.videosTabBarItem.title = "●"
//        self.exampleTabBarItem.title = ""
//        self.notesTabBarItem.title = ""
//        self.settingsTabBarItem.title = ""
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = nil
        self.navigationController?.isNavigationBarHidden = true
        selectedIndex = getSelectedIndex()
        self.tabBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
//        self.navigationItem.title = ""
    }
    
    func getSelectedIndex() -> Int {
        return viewControllers?.firstIndex(of: selectedViewController!) ?? 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.accentColor(), NSAttributedString.Key.font: UIFont.appFontBold(ofSize: 11)], for: .selected)
//        self.videosTabBarItem.title =  ""
//        self.exampleTabBarItem.title = ""
//        self.notesTabBarItem.title = ""
//        self.settingsTabBarItem.title = ""
//        item.title = "●"
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if type(of: viewController) == VideosViewController.self {
            (viewController as? VideosViewController)?.language = language
        } else if  type(of: viewController) == ExampleViewController.self  {
            (viewController as? ExampleViewController)?.language = language
        } else if type(of: viewController) == ProfileViewController.self {
            
        }

        return true
    }
}
