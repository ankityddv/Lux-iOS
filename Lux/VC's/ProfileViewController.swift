//
//  ProfileViewController.swift
//  Lux
//
//  Created by ANKIT YADAV on 05/09/19.
//  Copyright © 2019 ANKIT YADAV. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var signOutBttn: UIButton!
    
    @IBAction func signOut(_ sender: Any) {
        try!Auth.auth().signOut()
        self.performSegue(withIdentifier: "signedOut", sender: self)
        SVProgressHUD.show(withStatus: "Logging Out!")
    }
    
    func fetchAllDetails () {
        //SVProgressHUD.show(withStatus: "Loading...")
            self.fetchName()
            self.fetchProfileImage()
          
    }
    
    func fetchName(){
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        ref.child("USER").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let username = value?["Name"] as? String ?? ""
            self.nameLabel.text = username
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    //
    func fetchProfileImage(){
        //retrive image
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("user/profile_images")
        let imageRef = storageRef.child("\(uid).png")
        imageRef.getData(maxSize: 1*1000*1000) { (data,error) in
            if error == nil{
                print(data ?? Data.self)
                self.profileImage.image = UIImage(data: data!)
            }
            else{
                print(error?.localizedDescription ?? error as Any)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signOutBttn.layer.cornerRadius = 8
        profileImage.layer.cornerRadius = profileImage.bounds.height / 2
        profileImage.clipsToBounds = true
        fetchAllDetails()
    }
    

}
