//
//  UISearchViewController.swift
//  MySwiftDemo
//
//  Created by Nick on 2018/10/17.
//  Copyright © 2018 nick. All rights reserved.
//

import UIKit

class UISearchViewController: UIViewController {
    
    var contries = Countries.list
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .plain)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        self.presentSearch()
    }
    
    func presentSearch() {
        
//        let resultVc = SearchResultViewController()
        let searchVc = UISearchController(searchResultsController: nil)
        searchVc.hidesNavigationBarDuringPresentation = false
        searchVc.dimsBackgroundDuringPresentation = false
        searchVc.searchBar.searchBarStyle = .minimal
        searchVc.searchBar.sizeToFit()
        
        tableView.tableHeaderView = searchVc.searchBar
    }

}

extension UISearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("update")
    }
}

extension UISearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = contries[indexPath.row]
        return cell
    }
}

extension UISearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select \(indexPath.row)")
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
