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
    
    @IBAction func onSignOutClick(_ sender: Any) {
        performSegue(withIdentifier: "mainToInitial", sender: self)
    }
    

}
