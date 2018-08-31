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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        myButton = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        myButton.setBackgroundImage(UIImage(named: "icon"), for: .normal)
        myButton.setTitle("RxswiftButton", for: .normal)
        
        let disposeBag = DisposeBag()
        myButton.rx.tap
            .subscribe(onNext: {
            print("onnext")
        })
        .disposed(by: disposeBag)
        
        view.addSubview(myButton)
    }

    func rxswiftButtonClick() {
        print("rxswiftButtonClick")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
