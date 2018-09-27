//
//  MusicListViewController.swift
//  MySwiftDemo
//
//  Created by Nick on 2018/9/27.
//  Copyright © 2018 nick. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MusicListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var musicLists = MusicLists()
    let dispodeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "musicCell")
        
        musicLists.data.bind(to: tableView.rx.items(cellIdentifier: "musicCell")) { (index, music, cell) in
                print("\(index)   \(music)   ")
            cell.textLabel?.text = music.name
            cell.detailTextLabel?.text = music.song
        }.disposed(by: dispodeBag)
        
        tableView.rx.modelSelected(Music.self).subscribe(onNext: {
             (music) in
                print("选中的music\(music)")
        }).disposed(by: dispodeBag)
    }

}
