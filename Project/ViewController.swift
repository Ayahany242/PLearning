//
//  ViewController.swift
//  Project
//
//  Created by Asma hassan on 10/31/21.
//  Copyright © 2021 Asma hassan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


  
    @IBOutlet weak var signUpButton: UIButton!
    
    
    @IBOutlet weak var logInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func setUpElements(){
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleFilledButton(logInButton)
      
        
    }

}

