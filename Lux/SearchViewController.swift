//
//  SearchViewController.swift
//  Lux
//
//  Created by ANKIT YADAV on 17/09/19.
//  Copyright © 2019 ANKIT YADAV. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var searchArr = ["Acura","Alpina","Audi","BAIC Motor","Bentley","BMW","Cadillac","Chevrolet","Corvette","Dodge","Force Motors","Ford","General Motors","Genesis"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        cell.label.text = searchArr[indexPath.row]
        cell.label.textColor = UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SearchPerformedViewController") as! SearchPerformedViewController
        vc.labelTxt = searchArr[indexPath.row]
        //vc.Bkchdi = nameArr[indexPath.row]
        //vc.msg = msgArr[indexPath.row]
        //vc.image = nameArr[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupNavBar() {
        var nav = self.navigationController?.navigationBar
        
        nav?.prefersLargeTitles = true
        nav?.barTintColor = UIColor.black
        nav?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.98, green:0.84, blue:0.00, alpha:1.0)]
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.98, green:0.84, blue:0.00, alpha:1.0)]
        //nav?.titleTextAttributes = [.foregroundColor: UIColor.orange]
        //navigationController?.navigationBar.tintColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.white
        
        let searchController = UISearchController(searchResultsController: nil)
        //let searchBar = UISearchBar()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        //searchBar.tintColor = UIColor.white
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
    }
    

}
