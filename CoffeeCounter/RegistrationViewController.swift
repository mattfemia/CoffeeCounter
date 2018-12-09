//
//  RegistrationViewController.swift
//  CoffeeCounter
//
//  Created by Matthew Femia on 12/8/18.
//  Copyright © 2018 Matthew Femia. All rights reserved.
//

import UIKit

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
    
    
    @IBAction func onSignUpClick(_ sender: Any) {
        performSegue(withIdentifier: "registrationToMain", sender: self)
    }
    
    @IBAction func onLoginClick(_ sender: Any) {
        performSegue(withIdentifier: "registrationToLogin", sender: self)
    }
    
    
}
