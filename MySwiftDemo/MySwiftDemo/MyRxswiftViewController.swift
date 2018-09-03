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
    var myTextField: UITextField!
    let disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height

        myButton = UIButton(frame: CGRect(x: 100, y: screenHeight - 200, width: screenWidth - 200, height: 200))
        myButton.setBackgroundImage(UIImage(named: "icon"), for: .normal)
        myButton.setTitle("RxswiftButton", for: .normal)
        view.addSubview(myButton)
        
        myTextField = UITextField(frame: CGRect(x: 100, y: 100, width: screenWidth - 200, height: 40))
        myTextField.borderStyle = .line
        view.addSubview(myTextField)
        
        demo1()
        demo2()
        
    }

    func demo1() {
        // rx button tap
        myButton.rx.tap
            .subscribe(onNext: {
                print("button tap")
            })
            .disposed(by: disposeBag)
    }
    
    func demo2() {
        // rx notification
        NotificationCenter.default.rx.notification(Notification.Name.UITextFieldTextDidChange).subscribe { (notification) in
            print("recieve notification---\(notification)")
            }.disposed(by: disposeBag)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
