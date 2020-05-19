//
//  ProfileController.swift
//  InMindApp
//
//  Created by Dorian Solant on 18/05/2020.
//  Copyright © 2020 Dorian Solant. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ProfileController: UIViewController {

    // Outlets
    
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if let user = Auth.auth().currentUser {
            
            let ref = Database.database().reference()
            let userID = Auth.auth().currentUser?.uid
            ref.child("users").child(userID!).observeSingleEvent(of: .value) { (snapshot) in
                let value = snapshot.value as? NSDictionary
                
                let username = value?["username"] as? String ?? "Pas de nom"
                
                self.usernameLabel.text = username
            }
        } else {
            fatalError("Erreur : Aucun utilisateur n'est connecté")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    // Actions
    @IBAction func logOutButtonWasPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        } catch {
            print("Erreur : Impossible de déconnecter l'utilisateur")
        }
        
    }
    
    
    
    
}
