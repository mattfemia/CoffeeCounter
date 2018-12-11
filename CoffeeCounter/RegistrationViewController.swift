//
//  LoginViewController.swift
//  CoffeeCounter
//
//  Created by Matthew Femia on 12/8/18.
//  Copyright © 2018 Matthew Femia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class RegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmTextField: UITextField!
    
    @IBAction func onLoginClick(_ sender: Any) {
        // Redirect to the LoginViewController
        performSegue(withIdentifier: "registrationToLogin", sender: self)
    }
    
    @IBAction func onSignUpClick(_ sender: UIButton) {
        // Error checking for adequate user input into each field
        if (nameTextField.text?.isEmpty)! ||
            (usernameTextField.text?.isEmpty)! ||
            (emailTextField.text?.isEmpty)! ||
            (passwordTextField.text?.isEmpty)! ||
            (confirmTextField.text?.isEmpty)!  {
            
            // Send alert to user if all fields aren't filled out
            AlertController.showAlert(self, title: "Input Error", message: "Please fill out all fields")
        
        
        }
        // Check to make sure the users passwords match
        if (passwordTextField.text)! != (confirmTextField.text)! {
            
            AlertController.showAlert(self, title: "Password Error", message: "Passwords do not match.")
        }
        // Check for correct password length -- *Firebase requires >6 characters or it throws an error*
        if let pwLength = passwordTextField.text?.count {
                if pwLength < 6 {
                AlertController.showAlert(self, title: "Password Length Error", message: "Passwords must be longer than 6 characters")
                }
        }
        // Reassign email and password text fields to constants for Auth arguments
        if let email = emailTextField.text,
            let password = passwordTextField.text,
            let username = usernameTextField.text,
            let name = nameTextField.text {
                /* Create user authorization */
                // Syntax from: https://firebase.google.com/docs/auth/ios/start?authuser=0
                    Auth.auth().createUser(withEmail: email, password: password) {
                    (user, error) in
                    if (user != nil) {
                        
                        // Re-assign user as the username they provide
                        let userAssignment = Auth.auth().currentUser?.createProfileChangeRequest()
                        userAssignment?.displayName = username
                        userAssignment?.commitChanges { error in
                            if error == nil {
                                print("Username has been successfully assigned!")
                                }
                            }
                        /* Create Database for all the user input
                        Technical syntax from: https://firebase.google.com/docs/database/ios/read-and-write?authuser=0 */
                        // Initialize database 'db'
                        let db = Database.database().reference()
                        
                        // Populate data specific to each user
                        db.child("Users").child(username).setValue(["email": email, "name": name, "password": password])
                            /* STORE ENCRYPTED PASSWORD */
                                //TODO
                        
                            /* STORE uid */
                                // TODO
     
                            /* CREATE ERROR CHECKING FOR DB */
                                // TODO
                        
                        // Re-route user to Main Screen if User Auth and Database are successful
                        self.performSegue(withIdentifier: "registrationToMain", sender: self)
                    }
                    // if there is an error, display error message and re-route back to the startup screen
                    if (error != nil) {
                        AlertController.showAlert(self, title: "Error", message: "Error creating user, please try again later")
                        
                        self.performSegue(withIdentifier: "registrationToInitial", sender: self)
                    }
                }
            }
        }
}

