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
    
    private let appDel = UIApplication.shared.delegate as! AppDelegate
    
    var context : NSManagedObjectContext {
        return appDel.persistentContainer.viewContext
    }
    
    
    func getVideosInChapter(completion : ListeCompletion?) {
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
