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

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func onLoginClick(_ sender: Any) {
        guard let email = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) {user, error in
            if error == nil && user != nil {
            } else {
                print("Error logging in: \(error!.localizedDescription)")
            }
        }
        
        performSegue(withIdentifier: "loginToMain", sender: self)
    }
    
    @IBAction func onSignUpClick(_ sender: Any) {
        
        performSegue(withIdentifier: "loginToRegistration", sender: self)
    }
    
}
