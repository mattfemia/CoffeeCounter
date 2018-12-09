import UIKit
import Firebase
import FirebaseAuth

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
        guard let email = emailTextField.text,
            email != "",
            
        let password = passwordTextField.text,
            password != ""
            
        else {
            
            AlertController.showAlert(self, title: "Alert", message: "Please fill out all fields")
                
                return
        }
        
        Auth.auth().createUser(withEmail: email, password: password)
        {
            (user, error) in
            
            if (user != nil)
            {
                self.performSegue(withIdentifier: "registrationToMain", sender: self)
            }
            if (error != nil)
            {
                self.performSegue(withIdentifier: "registrationToLogin", sender: self)
            }
        }
    }
    
    @IBAction func onLoginClick(_ sender: Any) {
        performSegue(withIdentifier: "registrationToLogin", sender: self)
    }
    
    
}
