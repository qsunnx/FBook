//
//  LoginViewController.swift
//  FBook
//
//  Created by Qsunnx on 03.02.2021.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    private var authListener: AuthStateDidChangeListenerHandle?
    private var ref: DatabaseReference!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        authListener = Auth.auth().addStateDidChangeListener { (auth, user) in
            // здесь произошла удачная регистрация юзера если значение заполнено см. справку
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: loginTextField.text!, password: passwordTextField.text!){ [weak self] (result, error) in
            if error != nil {
                let alert = UIAlertController(title: "Ошибка авторизации", message: error!.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self?.present(alert, animated: false, completion: nil)
            }
            
            self?.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }
    
    @IBAction func registrationButtonPressed(_ sender: Any) {
        Auth.auth().createUser(withEmail: loginTextField.text!, password: passwordTextField.text!) { [weak self] authResult, error in
            guard error == nil else {
                let alert = UIAlertController(title: "Ошибка авторизации", message: error!.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self?.present(alert, animated: false, completion: nil)
                
                return
            }
            
            self?.ref.child("users").child("user").setValue(Auth.auth().currentUser?.uid)
            
            self?.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
    }
}
