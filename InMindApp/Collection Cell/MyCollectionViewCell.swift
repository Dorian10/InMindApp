//
//  MyCollectionViewCell.swift
//  InMindApp
//
//  Created by Dorian Solant on 12/05/2020.
//  Copyright © 2020 Dorian Solant. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    var liste : VideoCourseList!
    //var videos = [Video]()
    
    @IBOutlet var myImageView : UIImageView!
    @IBOutlet var myLabel : UILabel!
    
    @IBOutlet weak var myDateLabel: UILabel!
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    
    func setupCells(liste : VideoCourseList) {
        self.liste = liste
        
        if self.liste.name != nil {
            self.myLabel.text = self.liste.name
        } else {
            self.myLabel.text = "Pas de titre"
        }
        
        if self.liste.dateAdded != nil {
            self.myDateLabel.text = "Ajoutée le " + self.liste.dateAdded!.toString()
        } else {
            myDateLabel.text = "Aucune date disponible"
        }

        //videos.append(Model(text: myLabel.text!, imageName: "VideoCourse1"))


    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setup (with model : Video){
        self.myLabel.text = model.text
        self.myImageView.image = UIImage(named: model.imageName)
    }

    
}
