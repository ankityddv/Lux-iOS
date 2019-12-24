//
//  SearchViewController.swift
//  Lux
//
//  Created by ANKIT YADAV on 04/09/19.
//  Copyright © 2019 ANKIT YADAV. All rights reserved.
//

import UIKit


class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return text.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = text[indexPath.row]
        cell?.textLabel?.textColor = UIColor.white
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SearchPerformendViewController") as! SearchPerformendViewController
        vc.label = text[indexPath.row]
        //vc.Bkchdi = nameArr[indexPath.row]
        //vc.msg = msgArr[indexPath.row]
        //vc.image = nameArr[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    //@IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tblView: UITableView!
    
    var text = ["Acura","Alpina","Audi","BAIC Motor","Bentley","BMW","Cadillac","Chevrolet","Corvette","Dodge","Force Motors","Ford","General Motors","Genesis"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    func setupNavBar() {
        var nav = self.navigationController?.navigationBar
        
        nav?.prefersLargeTitles = true
        nav?.barTintColor = UIColor.black
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        //nav?.titleTextAttributes = [.foregroundColor: UIColor.orange]
        //navigationController?.navigationBar.tintColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.white
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Hide when touch outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
