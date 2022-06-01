//
//  DarkModeConfiguration.swift
//  Project
//
//  Created by Afnan MacBook Pro on 01/06/2022.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit
class DarkModeConfiguration {
    
    static let instance = DarkModeConfiguration()
    
    func isInDarkMode() -> Bool {
        if UserDefaults.standard.string(forKey: "isDarkMode") != nil {
            return true
        }
        if #available(iOS 12.0, *) {
            if UIApplication.shared.windows[0].rootViewController?.traitCollection.userInterfaceStyle == .dark {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func changeToDarkMode() {
        if #available(iOS 13.0, *) {
            UserDefaults.standard.setValue("true", forKey: "isDarkMode")
            UIApplication.shared.windows[0].overrideUserInterfaceStyle = .dark
        } else {
            // Fallback on earlier versions
        }
    }
    
    func changeToLightMode() {
        if #available(iOS 13.0, *) {
            UserDefaults.standard.setValue(nil, forKey: "isDarkMode")
            UIApplication.shared.windows[0].overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
    }
}
