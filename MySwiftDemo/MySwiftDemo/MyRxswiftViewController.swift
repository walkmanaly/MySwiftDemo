//
//  MyRxswiftViewController.swift
//  MySwiftDemo
//
//  Created by Nick on 2018/8/31.
//  Copyright © 2018年 nick. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MyRxswiftViewController: UIViewController {

    var myButton: UIButton!
    let disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        myButton = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        myButton.setBackgroundImage(UIImage(named: "icon"), for: .normal)
        myButton.setTitle("RxswiftButton", for: .normal)
        view.addSubview(myButton)
        
        myButton.rx.tap
            .subscribe(onNext: {
            print("button tap")
        })
        .disposed(by: disposeBag)
        
    }

//    func rxswiftButtonClick() {
//        print("rxswiftButtonClick")
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
