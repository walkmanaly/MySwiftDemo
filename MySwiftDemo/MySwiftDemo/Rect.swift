//
//  Rect.swift
//  MySwiftDemo
//
//  Created by Nick on 2018/9/30.
//  Copyright © 2018 nick. All rights reserved.
//

import Foundation

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var point = Point()
    var size = Size() {
        willSet {
            print("will set")
        }
        didSet {
            print("did set")
        }
    }
    // center计算型属性，它并不存储值；通过其他属性的值得出结果，或通过外界传进来的值修改其他属性。
    var center: Point {
        get {
            let centerx = size.width / 2 - point.x
            let centery = size.height / 2 - point.y
            return Point(x: centerx, y: centery)
        }
        
        // 此处如果不用变量newCenter，swift有默认变量newValue供使用
        set (newCenter) {
            point.x = newCenter.x - size.width / 2
            point.y = newCenter.y - size.height / 2
        }
        
//        set {
//            point.x = newValue.x - size.width / 2
//            point.y = newValue.y - size.height / 2
//        }
    }
}
