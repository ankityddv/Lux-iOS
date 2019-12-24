//
//  ViewController.swift
//  Lux
//
//  Created by ANKIT YADAV on 01/09/19.
//  Copyright © 2019 ANKIT YADAV. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var imageArr = ["1p","2p","3p"]
    var labelArr = ["Search more than 2,000 luxury cars, exotic cars.","30 luxury Jets for rent.", "Get extraordinary stuff you’ll find nowhere."]
    @IBOutlet weak var pageCtrl: UIPageControl!
    @IBOutlet weak var getstartedCV: UICollectionView!
    var timer = Timer()
    var counter = 0
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GetStartedCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GetStartedCollectionViewCell", for: indexPath) as! GetStartedCollectionViewCell
        cell.imageView.image = UIImage(named: imageArr[indexPath.row])
        cell.label.text = labelArr[indexPath.row]
        return cell
    }
    
    @objc func changeImage(){
        
        if counter < imageArr.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.getstartedCV.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageCtrl.currentPage = counter
            counter += 1
        }
        else{
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.getstartedCV.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageCtrl.currentPage = counter
            counter = 1
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        pageCtrl.numberOfPages = imageArr.count
        pageCtrl.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.4, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
    
    


}

