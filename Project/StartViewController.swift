//
//  StartViewController.swift
//  Project
//
//  Created by Aya on 5/11/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {



  
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var logInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
       
    }

    func setUpElements(){
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleFilledButton(logInButton)
        
    }
    @IBAction func signUpdidTapViewController(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController
            else{
        return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func logindidTapViewController(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController
            else{
        return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
