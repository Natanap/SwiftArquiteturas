//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by Natanael Alves Pereira on 24/02/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var senhaTextField: UITextField!
    
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    @IBAction func registerButtonTap(_ sender: Any) {
        if let email = emailTextField.text, let confirmpassword = confirmPasswordTextField.text, let password = senhaTextField.text {
            if password != confirmpassword {
                self.showMessage(title: "Erro", message: "Senhas não conferem")
                return
            }
            let manager = UserManager(business: UserBusiness())
            
            manager.register(email: email, password: password) { usermModel in
                self.openHomeView()
            } failureHandler: { error in
                self.showMessage(title: "Erro", message: error.localizedDescription)
            }

        }
    }
    
    @IBAction func openButtonTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func openHomeView() {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }
}
