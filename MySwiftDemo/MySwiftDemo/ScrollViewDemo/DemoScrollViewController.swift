//
//  DemoScrollViewController.swift
//  MySwiftDemo
//
//  Created by Nick on 2018/9/5.
//  Copyright © 2018年 nick. All rights reserved.
//

import UIKit

class DemoScrollViewController: UIViewController {

    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollview.delegate = self
        scrollview.minimumZoomScale = 1/25
        scrollview.maximumZoomScale = 1.0
        
//        let imageUrl = Bundle.main.url(forResource: "test", withExtension: "png")
        imageView.image = UIImage(named: "test.png")
        
        var first = 20
        var second = 50
        swapTwoInts(&first, &second)
        print("first=\(first) second=\(second)")
        
        let encrementer = makeEncrementer(input: 5)
        let rest = encrementer()
        let rest1 = encrementer()
        let rest2 = encrementer()
        // 捕获变量，所以每次调用totalNum都会在原来值的基础上增加
        print("result = \(rest) \(rest1) \(rest2)")
        
        let encrementer10 = makeEncrementer(input: 10)
        let result0 = encrementer10()
        let result1 = encrementer10()
        let result2 = encrementer10()
        // 捕获的变量跟上面的没影响，捕获各自的变量
        print("result = \(result0) \(result1) \(result2)")
    }

    // inout 把传进来的参数做修改（修改外部变量）注意：传变量的引用
    func swapTwoInts(_ first: inout Int, _ second: inout Int) {
        var temp = 0
        temp = first
        first = second
        second = temp
    }
    
    // function type
    func forword(_ forword: Int) -> Int {
        return forword - 1
    }
    
    func backword(_ backword: Int) -> Int {
        return backword + 1
    }
    
    func chooseForwordOrBackword(_ isBackword: Bool) -> (Int) -> Int {
        if isBackword {
            return backword
        } else {
            return forword
        }
    }
    
    // nested function
    func nestedChoose(_ isBackword: Bool) -> (Int) -> Int {
        func backWord(input: Int) -> Int {
            return input - 1
        }
        func forword(input: Int) -> Int {
            return input + 1
        }
        return isBackword ? backWord : forword
    }
    
    // 捕获变量
    func makeEncrementer(input amount: Int) -> () -> Int {
        var totalNum = 0
        func encrementter() -> Int {
            totalNum += amount
            return totalNum
        }
        return encrementter
    }

}

extension DemoScrollViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
