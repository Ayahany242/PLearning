//
//  SignUpViewController.swift
//  Project
//
//  Created by Asma hassan on 2/7/22.
//  Copyright © 2022 Asma hassan. All rights reserved.
//

import UIKit
import FirebaseAuth

import Firebase
class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements(){
        //Hide the error label
        errorLabel.alpha = 0

        //style the element

        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)

        Utilities.styleFilledButton(signUpButton)

    }
//check the field and validate that the data is correct. if everything is correct , this method return nill. otherwise it returns the erroe message as a sstring
    func validatefield() -> String?{
        
        //check  that all field are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "Please fill in all fields."
        }
        // check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            //password isnt secure enough
            return "Please make sure your password is at least 8 charcter ,contain a special character and a number"
        }
        return nil
    }

    @IBAction func signUpTapped(_ sender: Any) {
        //validate the fields
        let error = validatefield()
              if error != nil {
                  // there's something wrong with field , show error message
                showError(error!)
              }
              else {
                // create clean virsion of the data
                let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                
                
                //Create the user
                Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                    // check for error
                    if err != nil {
                        
                        //There was an error creating the user
                        self.showError("Error creating user")
                    }
                    else{
                        //User was created successfuly, now store the first name and last name
                        let db =  Firestore.firestore()
                        db.collection("users").addDocument(data: ["firstname" :firstName ,"lastname" : lastName,"uid":result!.user.uid]) { (error) in
                            if error != nil{
                                //show error message
                                self.showError("Error Saving User Data")
                            }
                        }
                                        // transation to the home screen
                        self.transitionToHome()
                    }
                }
                

                
        }

      
        
    }
   func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func  transitionToHome(){
        let homeViewController =
        storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
