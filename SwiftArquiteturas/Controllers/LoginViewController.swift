//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by Natanael Alves Pereira on 27/12/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
   
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    
    @IBAction func loginTappedButton(_ sender: Any) {
        let manager = UserManager(business: UserBusiness())
        
        if let email = emailTextField.text , let password = senhaTextField.text{
            manager.login(email: email, password: password) { userModel in
                print("sucesso")
                let home = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
                home.modalPresentationStyle = .fullScreen
                self.present(home, animated: true)
                
            } failureHandler: { error in
                self.showMessage(title: "Error", message: error?.localizedDescription ?? "")
            }

        }
    }
    
    @IBAction func registerTappedButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
}
