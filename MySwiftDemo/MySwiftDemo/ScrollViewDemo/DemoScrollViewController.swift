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
    }


}

extension DemoScrollViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
