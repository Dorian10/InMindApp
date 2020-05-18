//
//  SignupController.swift
//  InMindApp
//
//  Created by Dorian Solant on 17/05/2020.
//  Copyright © 2020 Dorian Solant. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignupController: UIViewController {

    // Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    

    // Properties
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupButtons()
        setupTextFieldManager()
        passwordTextField.textContentType = .oneTimeCode // Avoid autofill password
        
    }
    
    
    // Private functions
    private func setupButtons() {
        signupButton.layer.cornerRadius = 20
        loginButton.layer.cornerRadius = 20
        loginButton.layer.borderWidth = 3
        loginButton.layer.borderColor = UIColor.white.cgColor
        
    }
    
    private func setupTextFieldManager() {
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    
    // Actions
    @objc private func hideKeyboard() {
        usernameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

    
    @IBAction func signupButtonWasPressed(_ sender: UIButton) {
        if usernameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" {
            print("Inscription de \(usernameTextField.text ?? "Pas de nom")")
            
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authResult, error) in
                if error != nil {
                    print(error.debugDescription)
                } else {
                    
                    let ref = Database.database().reference()
                    let userID = Auth.auth().currentUser?.uid
                    ref.child("users").child("userID").setValue(["username": self.usernameTextField.text!])
                    
                    
                    
                    self.performSegue(withIdentifier: "GoToCalendarFromSignup", sender: self)
                }
            }
        } else {
            print("Erreur : Les champs ne sont pas complets")
        }
    }
    
    
    @IBAction func loginButtonWasPressed(_ sender: UIButton) {
        print("Redirection vers la page de connexion")
    }
    
    
    
}


extension SignupController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
}
