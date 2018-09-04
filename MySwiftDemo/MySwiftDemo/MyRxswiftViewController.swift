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
    @objc var name: String = "Nick"
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
        demo3()

        let items = ["jack", "rose", "nick"]
        // 数组越界，运行时错误
//        let five = items.remove(at: 5)
//        print(five)
        
        for item in items {
            print(item)
        }
        // 如果需要index
        for (index, item) in items.enumerated() {
            print("index=\(index)item=\(item)")
        }
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        name = "Jack"
    }
    
    func demo1() {
        // rx button tap
        myButton.rx.tap
            .subscribe(onNext: {
                print("button tap")
                let scrollDemoVc = DemoScrollViewController()
                self.navigationController?.pushViewController(scrollDemoVc, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    func demo2() {
        // rx notification
        NotificationCenter.default.rx.notification(Notification.Name.UITextFieldTextDidChange).subscribe { (notification) in
            print("recieve notification---\(notification)")
            }.disposed(by: disposeBag)
        
    }
    
    func demo3() {
        // kvo
        
        self.rx.observe(String.self, #keyPath(name)).subscribe(onNext: { newVlue in
            
            if let vlue = newVlue {
                print(vlue)
            }
            
        }).disposed(by: disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
