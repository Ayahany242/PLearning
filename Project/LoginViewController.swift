//
//  LoginViewController.swift
//  Project
//
//  Created by Asma hassan on 2/7/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import FirebaseAuth
import UIKit
//import GoogleSignIn


class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpElements()
        
        
        //add google signin button
        //
        //        let googleButton = GIDSignInButton()
        //        googleButton.frame = CGRect(x: 16, y: 116 + 80, width: view.frame.width - 32, height: 50)
        //        view.addSubview(googleButton)
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(logInButton)
    }
    
    @IBAction func logInTapped(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        ActivityIndicator.instance.show(self.view)
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            ActivityIndicator.instance.hide()
            if error != nil {
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            } else {
                UserDefaults.standard.set(true, forKey: "isLogin")
                guard let homeViewController = self.storyboard?.instantiateViewController(identifier: "LanguagesViewController") as? LanguagesViewController else {return}
                self.navigationController?.pushViewController(homeViewController, animated: true)
            }
        }
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        if let viewcontroller = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController{
            self.navigationController?.pushViewController(viewcontroller, animated: true)
        }
    }
    
}
