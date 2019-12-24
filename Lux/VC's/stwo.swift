//
//  SearchPerformendViewController.swift
//  Lux
//
//  Created by ANKIT YADAV on 17/09/19.
//  Copyright © 2019 ANKIT YADAV. All rights reserved.
//

import UIKit

class SearchPerformendViewController: UIViewController {

    
    var label = ""
    
    @IBOutlet weak var searchedLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        searchedLabel.text = label
        // Do any additional setup after loading the view.
    }
    

}
