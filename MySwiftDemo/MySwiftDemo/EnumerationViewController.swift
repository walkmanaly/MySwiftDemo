//
//  EnumerationViewController.swift
//  MySwiftDemo
//
//  Created by Nick on 2018/9/19.
//  Copyright © 2018年 nick. All rights reserved.
//

import UIKit

class EnumerationViewController: UIViewController {

    // rawValue and associatedValue
    
    enum season: Int {
        case spring = 1
        case summer
        case fall
        case winter
    }
    
//    enum Tea: CaseIterable {
//        case milktea, greentea, blacktea
//
//    }
    
    var now = season.spring

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view.
        testEnum()
        print(season.spring.rawValue)
    }
    
    func testEnum() {
//        now  = .fall
        switch now {
        case .spring:
            print("it is spring")
        
        case .summer:
            print("it is summer")
            
        case .fall:
            print("it is fall")
            
        case .winter:
            print("it is winter")
    
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
