//
//  DetailViewController.swift
//  Lux
//
//  Created by ANKIT YADAV on 06/09/19.
//  Copyright © 2019 ANKIT YADAV. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var detailsLbl: UILabel!
    
    var name = ""
    var price = ""
    var details = "" 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceLbl.text = price
        detailsLbl.text = details
        imgView.image = UIImage(named: name)
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
