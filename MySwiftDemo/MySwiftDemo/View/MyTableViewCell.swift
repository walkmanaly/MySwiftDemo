//
//  MyTableViewCell.swift
//  MySwiftDemo
//
//  Created by 黄锦兴 on 2018/8/27.
//  Copyright © 2018年 nick. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    let myLabel: UILabel?
    
    var myText: String? {
        didSet {
            if myText != nil {
                myLabel?.text = myText
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(myLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
