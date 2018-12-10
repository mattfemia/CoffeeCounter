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
        
        // Check to make sure the users passwords match
        }
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
            let name = nameTextField.text
            {
            /* Create user authorization
             Syntax from: https://firebase.google.com/docs/auth/ios/start?authuser=0 */
                Auth.auth().createUser(withEmail: email, password: password) {
                (user, error) in
            
                // Send the user to the home screen if a profile is created
                if (user != nil) {
                    let ref = Database.database().reference()
                    /* Use this syntax to set the user as the parent to a branch of the database
                        specific to the user https://firebase.google.com/docs/database/ios/read-and-write?authuser=0 */
                    ref.child("/Users").setValue(username);
                    
                    self.performSegue(withIdentifier: "registrationToMain", sender: self)
                }
                // if there is an error, send error and re-route back to the startup screen
                if (error != nil) {
                    AlertController.showAlert(self, title: "Error", message: "Error creating user, please try again later")
                    
                    self.performSegue(withIdentifier: "registrationToInitial", sender: self)
                    }
                }
            }
        }
}

