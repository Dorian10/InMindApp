//
//  ExtensionDate.swift
//  InMindApp
//
//  Created by Dorian Solant on 13/05/2020.
//  Copyright © 2020 Dorian Solant. All rights reserved.
//

import Foundation

extension Date {
    
    func toString() -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
    
    
    
}
