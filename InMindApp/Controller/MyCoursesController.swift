//
//  ViewController.swift
//  InMindApp
//
//  Created by Dorian Solant on 12/05/2020.
//  Copyright © 2020 Dorian Solant. All rights reserved.
//

import UIKit
import CoreData
import SideMenu

class MyCoursesController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Outlets
    @IBOutlet var table : UITableView!
    @IBOutlet weak var sectionLabel: UILabel!
    // TextField et Button pour ajouter des données
    @IBOutlet weak var myTextField: UITextField!
    
    // Variables
    var videos = [Video]()
    var listes : [VideoCourseList] = []
    var menu : SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Slide Menu
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        
        
        updateListe()
        sectionLabel.text = "Maths"
        
        videos = VideoCollection().getVideosFromCollection()
        
        // Table
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }

    // setupCells(liste : listes[indexPath.row]) COMMENT FAIRE ?
    
    // Fonctions
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
     
    // Actions
    @IBAction func addVideo(_ sender: UIButton) {
        CoreDataHelper().saveVideo(myTextField.text)
        updateListe()
    }
    
    @IBAction func didTapMenu() {
        present(menu!, animated: true)
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

class MenuListController: UITableViewController {
    
    var sections = ["Maths", "Physique", "Français"]
    
    let darkColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = darkColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = sections[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
