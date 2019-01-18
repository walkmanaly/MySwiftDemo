//
//  ComputedPropertyTest.swift
//  MySwiftDemo
//
//  Created by Nick on 2019/1/16.
//  Copyright © 2019 nick. All rights reserved.
//

import Foundation

class MyFeture {
    var height: Float = 172.0
    var weight: Float = 62.0
    
    // 计算型属性并不存储任何值，当它被访问的时候，调用get去计算某个值再返回；(计算属性的值，得到结果)
    //                      当它被赋值的时候，调用set去设置该对象的属性。
    var heightWithChange: Float {
        get {
            return self.height + 10
        }
        set {
            self.height = self.height + newValue
        }
    }
    
    // 如果是只读属性，不需要写get
    var myHeight: Float {
        return self.height
    }
}




