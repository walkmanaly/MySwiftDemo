//
//  LasyPropertyViewController.swift
//  MySwiftDemo
//
//  Created by Nick on 2018/9/30.
//  Copyright © 2018 nick. All rights reserved.
//

import UIKit

class LasyPropertyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        lazyProperty()
    }

    func lazyProperty() {
        let per = Person()
        per.name = "Nick"
        // 第一次调用per.friend的时候才会创建friend对象，懒加载的作用
        print(per.friend)
    }

}
