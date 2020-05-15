//
//  ViewController.swift
//  InMindApp
//
//  Created by Dorian Solant on 12/05/2020.
//  Copyright © 2020 Dorian Solant. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table : UITableView!
    @IBOutlet weak var sectionLabel: UILabel!
    
    // TextField et Button pour ajouter des données
    @IBOutlet weak var myTextField: UITextField!
    
    var videos = [Video]()
    var listes : [VideoCourseList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateListe()
        sectionLabel.text = "Maths"
        
        videos = VideoCollection().getVideosFromCollection()
        
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }

    // setupCells(liste : listes[indexPath.row]) COMMENT FAIRE ?
    
    func updateListe () {
        CoreDataHelper().getVideoCourses { (listes) in
            if listes != nil {
                DispatchQueue.main.async {
                    self.listes = listes!
                    self.table.reloadData()
                    print(listes!.count)
                }
            }
        }
    }
     
    
    @IBAction func addVideo(_ sender: UIButton) {
        CoreDataHelper().saveVideo(myTextField.text)
        updateListe()
    }
    
    
    // Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return videos.count
        return listes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for : indexPath) as! CollectionTableViewCell
        cell.setup(with: videos)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }

 
    
}

