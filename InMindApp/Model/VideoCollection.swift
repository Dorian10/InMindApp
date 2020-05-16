//
//  VideoCollection.swift
//  InMindApp
//
//  Created by Dorian Solant on 15/05/2020.
//  Copyright © 2020 Dorian Solant. All rights reserved.
//

import UIKit

class VideoCollection {
    
    func getVideosFromCollection() -> [Video] {
        
        var videos : [Video] = []
        
        let video1 = Video(videoId: "n5_pRx4ozIg", videoTitle: "LE COURS : Fonctions affines - Troisième")
        
        let video2 = Video(videoId: "eLTCwPcTyHk", videoTitle: "Nombres complexes - Définition - Maths terminale - Les Bons Profs")
        
        let video3 = Video(videoId: "4RkLVgGCVgw", videoTitle: "8 astuces BONNES NOTES | comment réussir ses études?")
        
        let video4 = Video(videoId: "ZyZTQ2oRQZU", videoTitle: "Théorème de Thalès - Maths 3e - Les Bons Profs")
        
        videos.append(video1)
        videos.append(video2)
        videos.append(video3)
        videos.append(video4)
        videos.append(video1)
        videos.append(video2)
        videos.append(video3)
        videos.append(video4)
        
        return videos
        
        
        
        
    }
    
    
    
    
}
