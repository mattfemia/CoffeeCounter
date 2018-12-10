//
//  MainViewController.swift
//  CoffeeCounter
//
//  Created by Matthew Femia on 12/8/18.
//  Copyright © 2018 Matthew Femia. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Make a counter
        // TODO
    
    // Adjust counter to the amount of coffees the user has -- read and write to the Firebase Database
        // TODO
    
    @IBAction func onSignOutClick(_ sender: Any) {
        performSegue(withIdentifier: "mainToInitial", sender: self)
    }
    

}
