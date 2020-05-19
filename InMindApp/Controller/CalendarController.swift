//
//  CalendarController.swift
//  InMindApp
//
//  Created by Dorian Solant on 17/05/2020.
//  Copyright © 2020 Dorian Solant. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CalendarController: UIViewController {

    // Outlets
    
    @IBOutlet weak var welcomeMessage: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if let user = Auth.auth().currentUser {
            
            let ref = Database.database().reference()
            let userID = Auth.auth().currentUser?.uid
            ref.child("users").child(userID!).observeSingleEvent(of: .value) { (snapshot) in
                let value = snapshot.value as? NSDictionary
                
                let username = value?["username"] as? String ?? "Pas de nom"
                
                self.welcomeMessage.text = username

            }
        } else {
            fatalError("Erreur : Aucun utilisateur n'est connecté")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*if let user = Auth.auth().currentUser {
            // User connected
            welcomeMessage.text = user.email
        } else {
            fatalError("Erreur ! Aucun utilisateur connecté lors de l'affichage de l'écran d'accueil")
        }*/

    }
    
}
