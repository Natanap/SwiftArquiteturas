//
//  RegisterViewController.swift
//  SwiftArquiteturas
//
//  Created by Natanael Alves Pereira on 24/02/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    let presenter: RegisterPresenter = RegisterPresenter()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var senhaTextField: UITextField!
    
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    @IBAction func registerButtonTap(_ sender: Any) {
        if let email = emailTextField.text, let password = senhaTextField.text, password == confirmPasswordTextField.text {
            let userModel = UserModel(email: email, password: password)
            presenter.register(userModel: userModel)
        } else{
            showMessage(title: "Erro", message: "Algum dado digitado não confere")
        }
       
    }
    
    @IBAction func openButtonTap(_ sender: Any) {
        presenter.delegate?.goHome()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
}

extension RegisterViewController: RegisterPresenterDelegate {
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func goHome() {
        let home = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
        home.modalPresentationStyle = .fullScreen
        self.present(home, animated: true)
    }
}
