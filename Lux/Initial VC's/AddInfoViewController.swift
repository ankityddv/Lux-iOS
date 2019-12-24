
//
//  AddInfoViewController.swift
//  Lux
//
//  Created by ANKIT YADAV on 03/09/19.
//  Copyright © 2019 ANKIT YADAV. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class AddInfoViewController: UIViewController {

    var ref:DatabaseReference?
    var selectedImage: UIImage?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var continueBttn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func continueBtttn(_ sender: Any) {
        self.performSegue(withIdentifier: "donne", sender: self)
        updateAllInfo()
    }
    
    //Update data of user in Firebase
    
    func updateAllInfo() {
        updateData()
        updateProfileImage()
        progressHUD()
    }
    
    func updateData() {
        self.ref = Database.database().reference()
        guard let uid = Auth.auth().currentUser?.uid else { return }
        if self.phoneField.text != "" && self.nameField.text != ""
        {
            self.ref?.child("USER").child(uid).setValue(["Name" : self.nameField.text ,"Phone" : self.phoneField.text])
        }
        else
        {
            print("error")
        }
    }
    
    func updateProfileImage(){
        
        let storageRef = Storage.storage().reference().child("user/profile_images")
        let profileImg = self.selectedImage
        
        guard let imageData = profileImg?.jpegData(compressionQuality: 0.2) else { return }
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let ImageRef = storageRef.child("\(uid).png")
        let uploadTask = ImageRef.putData(imageData, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                return
            }
            let size = metadata.size
            ImageRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    return
                }
            }
        }
    }
    
    func progressHUD () {
        SVProgressHUD.showSuccess(withStatus: "Successful!")
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setForegroundColor(UIColor.black)           //Ring Color
        SVProgressHUD.setBackgroundColor(UIColor(red:0.98, green:0.84, blue:0.00, alpha:1.0))        //HUD Color
        //SVProgressHUD.setBackgroundLayerColor(UIColor.green)    //Background Color
    }
    
    @objc func openImagePicker(_ sender:Any) {
        // Open Image Picker
        let pickerController = UIImagePickerController()
        pickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(pickerController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueBttn.layer.cornerRadius = 10
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(imageTap)
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.clipsToBounds = true
        //
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    //Method of function
    func hideKeyboard(){
        nameField.resignFirstResponder()
    }
    //
    @objc func keyboardwilchange(notification: Notification){
        print("Keyboard will show: \(notification.name.rawValue)")
        view.frame.origin.y = -270
    }
    
    //UITextFieldDeligate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return Pressed")
        hideKeyboard()
        return true
    }
    //Hide when touch outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        view.frame.origin.y = 0
    }
}
extension AddInfoViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            selectedImage = image
            imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
