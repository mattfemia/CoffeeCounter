//
//  LoginViewController.swift
//  CoffeeCounter
//
//  Created by Matthew Femia on 12/8/18.
//  Copyright © 2018 Matthew Femia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBAction func onLoginClick(_ sender: Any) {
        performSegue(withIdentifier: "loginToMain", sender: self)
    }
    
    @IBAction func onSignUpClick(_ sender: Any) {
        performSegue(withIdentifier: "loginToRegistration", sender: self)
    }
    
}
