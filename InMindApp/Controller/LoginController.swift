//
//  LoginController.swift
//  InMindApp
//
//  Created by Dorian Solant on 17/05/2020.
//  Copyright © 2020 Dorian Solant. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginController: UIViewController {

    
    // Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldManager()
        setupButton()

    }
    
    
    // Private functions
    private func setupButton() {
        loginButton.layer.cornerRadius = 20
        
    }
    
    private func setupTextFieldManager() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    
    // Actions
    @objc private func hideKeyboard() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder() 
    }
    
    
    
    // Actions
    @IBAction func loginButtonWasPressed(_ sender: UIButton) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {

            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authResult, error) in
                if error != nil {
                    print(error.debugDescription)
                } else {
                    self.performSegue(withIdentifier: "GoToCalendarFromLogin", sender: self)
                }
            }
        } else {
            print("Erreur : Les champs ne sont pas complets")
        }
        
        
    }
    
    
    
    
    
    @IBAction func returnToSignupScreen(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

extension LoginController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
}
