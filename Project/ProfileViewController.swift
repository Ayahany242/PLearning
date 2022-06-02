//
//  ProfileViewController.swift
//  Project
//
//  Created by Asma hassan on 5/17/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ProfileViewController: UIViewController {
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    private let ref = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false

      //getData()
        // Do any additional setup after loading the view.
    }
         private func getData(){
            let user = Auth.auth().currentUser
            guard let uid = user?.uid else {return}
        ref.child("users\(uid)").getData(completion:  { error, snapshot in
          guard error == nil else {
            print(error!.localizedDescription)
            return;
          }
         let userName = snapshot.value as? String ?? "Unknown";
           // print(snapshot.value)
        });
    }
//    if Auth.auth().currentUser != nil {
//      // User is signed in.
//     let user = Auth.auth().currentUser
//      if let user = user {
//        // The user's ID, unique to the Firebase project.
//        // Do NOT use this value to authenticate with your backend server,
//        // if you have one. Use getTokenWithCompletion:completion: instead.
//        let uid = user.uid
//        let email = user.email
//        let photoURL = user.photoURL
//        var multiFactorString = "MultiFactor: "
//        for info in user.multiFactor.enrolledFactors {
//          multiFactorString += info.displayName ?? "[DispayName]"
//          multiFactorString += " "
//        }
//        // ...
//      }
//    } else {
//      // No user is signed in.
//      // ...
//    }
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
