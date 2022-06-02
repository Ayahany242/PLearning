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
    var language: Language?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        

    }
    
    @IBAction func openProfile(_ sender: UIButton) {
        if navigationController?.viewControllers.last is SettingViewController {
            navigationController?.popViewController(animated: true)
        } else {
            if let viewcontroller = self.storyboard?.instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController{
                self.navigationController?.pushViewController(viewcontroller, animated: true)
            }
        }
    }
    
    @IBAction func openAboutUs(_ sender: UIButton) {
                if navigationController?.viewControllers.last is SettingViewController {
            navigationController?.popViewController(animated: true)
        } else {
            if let viewcontroller = self.storyboard?.instantiateViewController(identifier: "AboutUsViewController") as? AboutUsViewController{
                self.navigationController?.pushViewController(viewcontroller, animated: true)
            }
        }
    }
    
    @IBAction func changeToDarkMode(_ sender: UISwitch) {
        if sender.isOn {
            DarkModeConfiguration.instance.changeToLightMode()
        } else {
            DarkModeConfiguration.instance.changeToDarkMode()
        }
    }
    
    @IBAction func changeLanguage(_ sender: UIButton) {
     if let viewcontroller = self.storyboard?.instantiateViewController(identifier: "LanguagesViewController") as? LanguagesViewController{
                self.navigationController?.pushViewController(viewcontroller, animated: true)
            }
     //   langaugeLabel.text =
    }

    @IBAction func logout(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "isLogin")
        if let viewcontroller = self.storyboard?.instantiateViewController(identifier: "StartViewController") as? StartViewController{
            self.navigationController?.pushViewController(viewcontroller, animated: true)
        }
    }
    
}
