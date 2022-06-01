//
//  SettingViewController.swift
//  Project
//
//  Created by Asma hassan on 5/30/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingViewController: UIViewController {
    
    @IBOutlet weak var langaugeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openProfile(_ sender: UIButton) {
        //
    }
    
    @IBAction func openAboutUs(_ sender: UIButton) {
        //
    }
    
    @IBAction func changeToDarkMode(_ sender: UISwitch) {
        if sender.isOn {
            DarkModeConfiguration.instance.changeToLightMode()
        } else {
            DarkModeConfiguration.instance.changeToDarkMode()
        }
    }
    
    @IBAction func changeLanguage(_ sender: UIButton) {
        
    }
    
    @IBAction func logout(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "isLogin")
        if let viewcontroller = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController{
            self.navigationController?.pushViewController(viewcontroller, animated: true)
        }
    }
    
}
