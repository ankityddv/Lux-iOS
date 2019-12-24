//
//  SignUpViewController.swift
//  Lux
//
//  Created by ANKIT YADAV on 01/09/19.
//  Copyright © 2019 ANKIT YADAV. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class SignUpViewController: UIViewController {
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var continueBttn: UIButton!
    
    @IBAction func continueBttn(_ sender: Any) {
        
        signUpUser()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueBttn.layer.cornerRadius = 8
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
        passwordField.resignFirstResponder()
    }
    //
    func activityStart() {
        
        activityIndicator.center = self.continueBttn.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
    }
    
    func signUpUser() {
        let email = emailField.text
        let password = passwordField.text
        
        if password!.count < 6 && password!.count >= 1 {
            // create the alert
            let alert = UIAlertController(title: "Invalid!!!", message: "Password must be greater than 6 characters!", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        else if email!.count == 0 && password!.count == 0 {
            // create the alert
            let alert = UIAlertController(title: "Invalid!!!", message: "Please enter the email and password!", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
            Auth.auth().createUser(withEmail: email! , password: password!){user,error in
                if user != nil
                {
                    self.performSegue(withIdentifier: "signUp", sender: self)
                    //self.updateData()
                    
                }
                else
                {
                    if let myError = error?.localizedDescription
                    {
                        print(myError)
                    }
                    else
                    {
                        print("ERROR")
                    }
                }
            }
            progressHUD()
        }
    }
    
    func progressHUD () {
        SVProgressHUD.show(withStatus: "Signing Up!")
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setForegroundColor(UIColor.black)           //Ring Color
        SVProgressHUD.setBackgroundColor(UIColor(red:0.98, green:0.84, blue:0.00, alpha:1.0))        //HUD Color
        //SVProgressHUD.setBackgroundLayerColor(UIColor.green)    //Background Color
    }
    
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
