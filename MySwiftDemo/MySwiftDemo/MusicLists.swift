//
//  MusicLists.swift
//  MySwiftDemo
//
//  Created by Nick on 2018/9/27.
//  Copyright © 2018 nick. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct MusicLists {
    let data = Observable<[Music]>.just([
        Music(name: "陈奕迅", song: "浮夸"),
        Music(name: "Mr.", song: "森林"),
        Music(name: "Westlife", song: "mylove"),
        Music(name: "林宥嘉", song: "说谎")
    ])
}

