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

        // Do any additional setup after loading the view.
    }
    

    @IBAction func editTapped(_ sender: Any) {
   
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
