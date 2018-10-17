//
//  CodableViewController.swift
//  MySwiftDemo
//
//  Created by Nick on 2018/10/17.
//  Copyright © 2018 nick. All rights reserved.
//

import UIKit

struct Plan: Codable {
    var name: String
    var age: Int
}

class CodableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

}
