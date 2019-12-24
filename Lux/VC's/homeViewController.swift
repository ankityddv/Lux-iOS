//
//  homeViewController.swift
//  Lux
//
//  Created by ANKIT YADAV on 03/09/19.
//  Copyright © 2019 ANKIT YADAV. All rights reserved.
//

import UIKit
import Firebase

class homeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    //First CV
    var imageArr1 = ["MERCEDES-BENZ G 63 AMG","FERRARI 488 PISTA","LAMBORGHINI AVENTADOR SVJ"]
    var nameArr1 = ["MERCEDES-BENZ G 63 AMG","FERRARI 488 PISTA","LAMBORGHINI AVENTADOR SVJ"]
    var priceArr1 = ["$305,404","Price On Request","$800,999"]
    var dataArr1 = ["The Mercedes-Benz G-Class has 1 Petrol Engine on offer. The Petrol engine is 3998 cc. It is available with the Automatic transmission. Depending upon the variant and fuel type the G-Class has a mileage of 8.13 kmpl. The G-Class is a 5 seater SUV and has a length of 4816 mm, width of 1976 mm and a wheelbase of 2850mm.","Ferrari today launched the much awaited 488 GTB in India. Priced at INR 3.88 crore, the 488 is a successor to the iconic 458 Italia and Ferrari’s second turbocharged attempt in recent times, post the last year introduced California T. It is powered by a twin-turbocharged 3.9-litre V8 engine that churns out a total of 661bhp and 760 Nm of peak torque. Power from the mid-placed engine is channeled through a revised 7-speed dual-clutch gearbox. It also features a Variable Torque Management system, which unleashes the massive twist from the engine linearly and powerfully right across its rev range. The 488 GTB is capable of doing 0-200 km/h in an unbelievable 8.3 seconds and 0-100 km/h in 3 seconds flat.","The Lamborghini Aventador has 1 Petrol Engine on offer. The Petrol engine is 6498 cc. It is available with the Automatic transmission. Depending upon the variant and fuel type the Aventador has a mileage of 5.0 to 7.69 kmpl. The Aventador is a 2 seater Coupe and has a length of 4843 mm, width of 2273 mm and a wheelbase of 2700mm."]
    //SecondCV
    var imageArr2 = ["Paras Quartier","Jade","New Luxury Villa in Marbella with sea and golf views"]
    var nameArr2 = ["Paras Quartier","Jade","New Luxury Villa in Marbella with sea and golf views"]
    var priceArr2 = ["₹ 99,000,000","€ 4.750.000","€ 4.250.000"]
    var countryArr2 = ["Gurgaon,India","Ibiza,Spain","Marbella,Spain"]
    //ThirdCV
    var imageArr3 = ["Numarine 37XP Hull","Princess 62 Flybridge","Conrad C133","Admiral Explorer 50"]
    var nameArr3 = ["Numarine 37XP Hull","Princess 62 Flybridge","Conrad C133","Admiral Explorer 50"]
    var priceArr3 = ["$ 12,500,000","€ 780.000","€ 18.500.000","€ 26.500.000"]
    //ForthCV
    var imageArr4 = ["Jacob and co GREEN PALATIAL FLYING TOURBILLON MINUTE REPEATER TITANIUM","Patek Philippe NEW LIMITED 6 PIECE","Patek Philippe Grand Complications 47.4mm","Richard Mille NEW & UNIQUE RM 57-02 Falcon"]
    var nameArr4 = ["Jacob and co GREEN PALATIAL FLYING TOURBILLON MINUTE REPEATER TITANIUM","Patek Philippe NEW LIMITED 6 PIECE","Patek Philippe Grand Complications 47.4mm","Richard Mille NEW & UNIQUE RM 57-02 Falcon"]
    var priceArr4 = ["$ 192,000","HK$ 161,000,000","HK$ 29,300,000","HK$ 11,000,000"]
    //FifthCV
    var imageArr5 = ["Cessna Citation CJ3","Merlin IVC Sn 427 N66GA 7489 TT","BOEING BUSINESS JET II BBJ Marc Newson","Falcon 900B"]
    var nameArr5 = ["Cessna Citation CJ3","Merlin IVC Sn 427 N66GA 7489 TT","BOEING BUSINESS JET II BBJ Marc Newson","Falcon 900B"]
    var priceArr5 = ["US$ 3,690,000","Price on Request","Price on Request","Price on Request"]
    var countryArr5 = ["United Kingdom","India","United States","Dubai,Saudi Arab"]
    //SixthCV
    var imageArr6 = ["Agusta AW 139-2008","Agusta AW 139-2012","Bell 505-delivery mid 2019","Eurocopter EC120B"]
    var nameArr6 = ["Agusta AW 139-2008","Agusta AW 139-2012","Bell 505-delivery mid 2019","Eurocopter EC120B"]
    var priceArr6 = ["€ 6.500.000","€ 8.800.000","Price On Request","€ 780.000"]
    var countryArr6 = ["United Kingdom","India","United States","Dubai,Saudi Arab"]
    
    
    @IBOutlet weak var carsCollectionView: UICollectionView!
    @IBOutlet weak var EstateCollectionView: UICollectionView!
    @IBOutlet weak var YatchesCollectionView: UICollectionView!
    @IBOutlet weak var watchesCollectionView: UICollectionView!
    @IBOutlet weak var jetsCollectionView: UICollectionView!
    @IBOutlet weak var helicoptersCollectionView: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.carsCollectionView
        {
            return imageArr1.count
        }
        else if collectionView == self.EstateCollectionView
        {
            return imageArr2.count
        }
        else if collectionView == self.YatchesCollectionView
        {
            return imageArr3.count
        }
        else if collectionView == self.watchesCollectionView
        {
            return imageArr4.count
        }
        else if collectionView == self.jetsCollectionView
        {
            return imageArr5.count
        }
        else
        {
            return imageArr6.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.carsCollectionView
        {
            let cell1: CarsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarsCollectionViewCell", for: indexPath) as! CarsCollectionViewCell
            cell1.imageView.image = UIImage(named: imageArr1[indexPath.row])
            cell1.nameLabel.text = nameArr1[indexPath.row]
            cell1.priceLabel.text = priceArr1[indexPath.row]
            return cell1
        }
        else if collectionView == self.EstateCollectionView
        {
            let cell2: EstateCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EstateCollectionViewCell", for: indexPath) as! EstateCollectionViewCell
            cell2.imageView.image = UIImage(named: imageArr2[indexPath.row])
            cell2.nameLabel.text = nameArr2[indexPath.row]
            cell2.priceLabel.text = priceArr2[indexPath.row]
            cell2.countryLabel.text = countryArr2[indexPath.row]
            return cell2
        }
        else if collectionView == self.YatchesCollectionView
        {
            let cell3: YatchesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "YatchesCollectionViewCell", for: indexPath) as! YatchesCollectionViewCell
            cell3.imageView.image = UIImage(named: imageArr3[indexPath.row])
            cell3.nameLabel.text = nameArr3[indexPath.row]
            cell3.priceLabel.text = priceArr3[indexPath.row]
            return cell3
        }
        else if collectionView == self.watchesCollectionView
        {
            let cell4:WatchesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WatchesCollectionViewCell", for: indexPath) as! WatchesCollectionViewCell
            cell4.imageView.image = UIImage(named: imageArr4[indexPath.row])
            cell4.nameLabel.text = nameArr4[indexPath.row]
            cell4.priceLabel.text = priceArr4[indexPath.row]
            return cell4
        }
        else if collectionView == self.jetsCollectionView
        {
            let cell5:JetsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JetsCollectionViewCell", for: indexPath) as! JetsCollectionViewCell
            cell5.imageView.image = UIImage(named: imageArr5[indexPath.row])
            cell5.nameLabel.text = nameArr5[indexPath.row]
            cell5.priceLabel.text = priceArr5[indexPath.row]
            cell5.countryLabel.text = countryArr5[indexPath.row]
            return cell5
        }
        else
        {
            let cell6:HelicoptersCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HelicoptersCollectionViewCell", for: indexPath) as! HelicoptersCollectionViewCell
            cell6.imageView.image = UIImage(named: imageArr6[indexPath.row])
            cell6.nsmeLabel.text = nameArr6[indexPath.row]
            cell6.priceLabel.text = priceArr6[indexPath.row]
            cell6.counteryLabel.text = countryArr6[indexPath.row]
            return cell6
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.carsCollectionView
        {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            vc.name = imageArr1[indexPath.row]
            vc.price = priceArr1[indexPath.row]
            //let ref = Database.database().reference()
            //ref.child("Data").observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                //let value = snapshot.value as? NSDictionary
                //let username = value?[self.nameArr1[indexPath.row]] as? String ?? ""
                //vc.details = username
                //self.nameLabel.text = username
            //}) { (error) in
                //print(error.localizedDescription)
            //}
            vc.details = dataArr1[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if collectionView == self.EstateCollectionView
        {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            vc.name = imageArr2[indexPath.row]
            vc.price = priceArr2[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if collectionView == self.YatchesCollectionView
        {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            vc.name = imageArr3[indexPath.row]
            vc.price = priceArr3[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if collectionView == self.watchesCollectionView
        {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            vc.name = imageArr4[indexPath.row]
            vc.price = priceArr4[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if collectionView == self.jetsCollectionView
        {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            vc.name = imageArr5[indexPath.row]
            vc.price = priceArr5[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            vc.name = imageArr6[indexPath.row]
            vc.price = priceArr6[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = true
    }

}
