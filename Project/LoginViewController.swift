//
//  LoginViewController.swift
//  Project
//
//  Created by Asma hassan on 2/7/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import FirebaseAuth
import UIKit
import GoogleSignIn


class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
        
        
        //add google signin button
        
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 16, y: 116 + 80, width: view.frame.width - 32, height: 50)
        view.addSubview(googleButton)
    }

  func setUpElements(){
    errorLabel.alpha = 0
    
    
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleFilledButton(logInButton)
        
    }

    @IBAction func logInTapped(_ sender: Any) {
        // validate the text field
            // sign in in the user
            // TODO: Validate Text Fields
            
            // Create cleaned versions of the text field
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Signing in the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if error != nil {
                    // Couldn't sign in
                    self.errorLabel.text = error!.localizedDescription
                    self.errorLabel.alpha = 1
                }
                else {
                    
                    let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
                    
                    self.view.window?.rootViewController = homeViewController
                    self.view.window?.makeKeyAndVisible()
                }
            }
            let name = self.emailTextField.text
//            let storyboard = UIStoryboard(name: "main", bundle: nil)
        if let viewcontroller = storyboard?.instantiateViewController(identifier: "MyHomeViewController") as? MyHomeViewController{
                viewcontroller.name = name ?? ""
                self.navigationController?.pushViewController(viewcontroller, animated: true)
            }
        
        }
    
}
