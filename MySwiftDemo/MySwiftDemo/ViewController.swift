//
//  ViewController.swift
//  MySwiftDemo
//
//  Created by 黄锦兴 on 2018/8/27.
//  Copyright © 2018年 nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var dataSource: [Int]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutTableView()
        genarateData()
    }
    
    func genarateData() {
        dataSource = [Int]()
        for _ in 1...9 {
            dataSource?.append(Int(arc4random_uniform(100)))
        }
    }
    
    func layoutTableView() {
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.rowHeight = 60
        myTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editAction))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func editAction() {
        myTableView.isEditing = !myTableView.isEditing
    }

}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataSource?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyTableViewCell()
        if let has = dataSource?[indexPath.row] {
            cell.myText = String(has)
        }
        return cell
    }
    
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            dataSource?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveNum = dataSource![sourceIndexPath.row]
        dataSource!.remove(at: sourceIndexPath.row)
        dataSource?.insert(moveNum, at: destinationIndexPath.row)
    }
    
}
