//
//  UserViewController.swift
//  CoffeeCounter
//
//  Created by Matthew Femia on 12/13/18.
//  Copyright © 2018 Matthew Femia. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class UserViewController: UIViewController {

    var importProf:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImportProf))
        profilePicture.isUserInteractionEnabled = true
        profilePicture.addGestureRecognizer(imageTap)
        importPictureButton.addTarget(self, action: #selector(openImportProf),
                                       for: .touchUpInside)
        
        
        importProf = UIImagePickerController()
        importProf.allowsEditing = true
        importProf.sourceType = .photoLibrary
        importProf.delegate = self
    }
    
    @objc func openImportProf(_ sender:Any) {
        self.present(importProf, animated: true, completion: nil)
    }
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    // Responds to being clicked to import the image per importProf
    @IBOutlet weak var importPictureButton: UIButton!
    
    @IBAction func importProfilePicture(_ sender: Any) {
    }
    
}


extension UserViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Sets control for cancelling out of image selection
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedPicture = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.profilePicture.image = selectedPicture
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
