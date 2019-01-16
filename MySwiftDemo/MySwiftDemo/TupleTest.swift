//
//  TupleTest.swift
//  MySwiftDemo
//
//  Created by Nick on 2019/1/16.
//  Copyright © 2019 nick. All rights reserved.
//

import Foundation

class MyTuple {
    func bodyFeture() -> ((height: Float, weight: Float)) {
        return (170.2, 62)
    }
}

let oneTuple = MyTuple()
let feture = oneTuple.bodyFeture()

//print("My weight is \(feture.weight), my height is \(feture.height)")
//tuple作为有多个返回值的函数很有用，可以把要返回的值放到一个突破了里，返回这个tuple
