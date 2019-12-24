//
//  BrandsViewController.swift
//  Lux
//
//  Created by ANKIT YADAV on 07/09/19.
//  Copyright © 2019 ANKIT YADAV. All rights reserved.
//

import UIKit

class BrandsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:BrandsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandsCollectionViewCell", for: indexPath) as! BrandsCollectionViewCell
        cell.imageView.image = UIImage(named: nameArr[indexPath.row])
        cell.nameLbl.text = nameArr[indexPath.row]
        return cell
    }
    
    var nameArr = ["Cars","Bikes","Watches","Yatches","Jets","Jwels"]
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let vc1 = storyboard?.instantiateViewController(withIdentifier: "brandsDetailViewController") as! brandsDetailViewController
            vc1.name = nameArr[indexPath.row]
            //vc.name = imageArr1[indexPath.row]
            //vc.price = priceArr1[indexPath.row]
            //vc.details = dataArr1[indexPath.row]
            self.navigationController?.pushViewController(vc1, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = true
    }

}
