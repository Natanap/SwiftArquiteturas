//
//  LoginViewController.swift
//  SwiftArquiteturas
//
//  Created by Natanael Alves Pereira on 27/12/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {

    let presenter: LoginPresenter = LoginPresenter()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    
    @IBAction func loginTappedButton(_ sender: Any) {
        if let email = emailTextField.text ,  let password = senhaTextField.text {
            let userModel = UserModel(email: email, password: password)
            presenter.login(userModel: userModel)
        }
        
    }
    
    @IBAction func registerTappedButton(_ sender: Any) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
}


extension LoginViewController: LoginPresenterDelegate {
    func goHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let home = storyboard.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
        
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    
}
