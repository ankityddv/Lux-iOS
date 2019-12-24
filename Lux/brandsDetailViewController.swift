//
//  brandsDetailViewController.swift
//  Lux
//
//  Created by ANKIT YADAV on 07/09/19.
//  Copyright © 2019 ANKIT YADAV. All rights reserved.
//

import UIKit

class brandsDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 500
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2")
        //cell?.textLabel?.text = arrayz
        cell?.textLabel?.textColor = UIColor.white
        return cell!
    }
    
    var name = ""
    var arrayz = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.topItem?.title = name
        //navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

}
