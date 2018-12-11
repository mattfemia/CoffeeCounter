//
//  MainViewController.swift
//  CoffeeCounter
//
//  Created by Matthew Femia on 12/8/18.
//  Copyright © 2018 Matthew Femia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let user = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "loginToInitial", sender: self)
        }
    }
    
    // Make a counter
        // TODO
    
    // Adjust counter to the amount of coffees the user has -- read and write to the Firebase Database
        // TODO
    
    @IBAction func onSignOutClick(_ sender: Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
        
        performSegue(withIdentifier: "mainToInitial", sender: self)
    }
    

}
