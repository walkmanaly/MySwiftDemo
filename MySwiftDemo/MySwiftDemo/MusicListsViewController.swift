//
//  MusicListsViewController.swift
//  MySwiftDemo
//
//  Created by Nick on 2018/9/27.
//  Copyright © 2018 nick. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MusicListsViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let musicList = MusicLists()
        let disposeBag = DisposeBag()
        
//        let nums = Observable.of(1, 2, 3, 4, 5)
//        nums.subscribe (
//            onNext: {
//                event in
//                print(event)
//        },
//            onError: {
//                error in
//                print(error)
//        },
//            onCompleted: {
//                print("completed")
//        }
//            ).disposed(by: disposeBag)
        
        musicList.data.bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (index, music, cell) in
            // configcell
            print("\(index)   \(music.name)   \(music.song)")
            cell.textLabel?.text = music.name
            }.disposed(by: disposeBag)
        
        
        tableView.rx.modelSelected(Music.self).subscribe(onNext: { (music) in
            print(music)
        }).disposed(by: disposeBag)
        
    }

}
