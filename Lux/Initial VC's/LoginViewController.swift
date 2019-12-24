//
//  LoginViewController.swift
//  Lux
//
//  Created by ANKIT YADAV on 01/09/19.
//  Copyright © 2019 ANKIT YADAV. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import GoogleSignIn

class LoginViewController: UIViewController,GIDSignInUIDelegate {
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var continueBttn: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var fbLoginBttn: UIButton!
    
    @IBAction func continueBttn(_ sender: Any) {
        signInUser()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueBttn.layer.cornerRadius = 8
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwilchange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        fbLoginBttn.layer.cornerRadius = 2
        // GoogleSignIn
        GIDSignIn.sharedInstance()?.uiDelegate = self 
        GIDSignIn.sharedInstance()?.signInSilently()
        let gSignIN = GIDSignInButton(frame: CGRect(x: 73.33, y: 498, width: 230, height: 30))
        //gSignIN.layer.cornerRadius = 8
        //gSignIN.center = view.center
        view.addSubview(gSignIN)
    }
    
    
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    //Sign In User
    func signInUser() {
        let email = emailField.text
        let password = passwordField.text
        
        
        if email!.count == 0 && password!.count == 0 {
            // create the alert
            let alert = UIAlertController(title: "Invalid!!!", message: "Please enter the email and password!", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!){user,error in
                
                self.performSegue(withIdentifier: "logIn", sender: self)
            }
            progressHUD()
        }
        
    }
    
    //GoogleSign In
  
    //Method of function
    func hideKeyboard(){
        passwordField.resignFirstResponder()
    }
    //
    
    func progressHUD () {
        SVProgressHUD.show(withStatus: "Signing In!")
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
