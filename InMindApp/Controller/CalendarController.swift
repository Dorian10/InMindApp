//
//  CalendarController.swift
//  InMindApp
//
//  Created by Dorian Solant on 17/05/2020.
//  Copyright © 2020 Dorian Solant. All rights reserved.
//

import UIKit
import FirebaseAuth

class CalendarController: UIViewController {

    // Outlets
    
    @IBOutlet weak var welcomeMessage: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = Auth.auth().currentUser {
            // User connected
            welcomeMessage.text = user.email
        } else {
            fatalError("Erreur ! Aucun utilisateur connecté lors de l'affichage de l'écran d'accueil")
        }

    }
    
}
