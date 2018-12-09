import UIKit

class InitialViewController: UIViewController {

    @IBAction func onLoginClick(_ sender: UIButton) {
        performSegue(withIdentifier: "initialToLogin", sender: self)
    }
    
    @IBAction func onSignupClick(_ sender: UIButton) {
        performSegue(withIdentifier: "initialToRegistration", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}
