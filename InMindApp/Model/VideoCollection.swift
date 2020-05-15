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
        
        let video1 = Video(text: "Premier", imageName: "VideoCourse1")
        
        let video2 = Video(text: "Deuxième", imageName: "VideoCourse2")
        
        let video3 = Video(text: "Troisième", imageName: "VideoCourse3")
        
        let video4 = Video(text: "Quatrième", imageName: "VideoCourse4")
        
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
