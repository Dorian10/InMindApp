//
//  Video.swift
//  InMindApp
//
//  Created by Dorian Solant on 15/05/2020.
//  Copyright © 2020 Dorian Solant. All rights reserved.
//

import Foundation

class Video {
    
    let videoTitle : String
    let videoId : String

    init(videoId : String, videoTitle : String) {
        
        self.videoId = videoId
        self.videoTitle = videoTitle
    }
    
}
