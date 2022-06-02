//
//  ProfileViewController.swift
//  Project
//
//  Created by Asma hassan on 5/17/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ProfileViewController: UIViewController {
    @IBOutlet weak var editProfileButton: UIButton!
    private let database = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func editTapped(_ sender: Any) {
   
    }
}
