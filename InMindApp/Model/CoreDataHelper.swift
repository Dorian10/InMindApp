//
//  CoreDataHelper.swift
//  InMindApp
//
//  Created by Dorian Solant on 13/05/2020.
//  Copyright © 2020 Dorian Solant. All rights reserved.
//

import UIKit
import CoreData


typealias ListeCompletion = (_ listes : [VideoCourseList]?) -> Void

class CoreDataHelper {
    
    // Récupérer base CoreData
    private let appDel = UIApplication.shared.delegate as! AppDelegate
    
    // Récupérer le contexte
    var context : NSManagedObjectContext {
        return appDel.persistentContainer.viewContext
    }
    
    // Sauvegarder dans CoreData
    func save () {
        appDel.saveContext()
    }
    
    /* Logique ENTITY VideoCourse */
    func saveVideo (_ string : String?) {
        guard let texte = string, texte != "" else { return }
        let nouvelleVideo = VideoCourseList(context: context)
        nouvelleVideo.name = texte
        nouvelleVideo.sectionName = "Maths"
        nouvelleVideo.dateAdded = Date()
        nouvelleVideo.chapterName = "Fonctions"
        save()
        print("Sauvegardé")
    }

    
    func getVideoCourses(completion : ListeCompletion?) {
        let fetchRequest : NSFetchRequest<VideoCourseList> = VideoCourseList.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "dateAdded", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            let listes = try context.fetch(fetchRequest)
            for l in listes {
                print(l.name)
            }
            completion?(listes)
            
        } catch {
            completion?(nil)
            print(error.localizedDescription)
        }
        
    }
    
    
    
    
    
    
    
    
    
}
