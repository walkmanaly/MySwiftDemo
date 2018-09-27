//
//  Music.swift
//  MySwiftDemo
//
//  Created by Nick on 2018/9/27.
//  Copyright © 2018 nick. All rights reserved.
//

import Foundation

struct Music {
    var name: String
    var song: String
    
    init(name: String, song: String) {
        self.name = name
        self.song = song
    }
}

extension Music: CustomStringConvertible {
    var description: String {
//        print("name---\(self.name) song---\(self.song)")
        return "name---\(self.name) song---\(self.song)"
    }
}
