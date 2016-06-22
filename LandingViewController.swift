//
//  LandingViewController.swift
//  Tortoise
//
//  Created by Jordan Donald on 6/19/16.
//  Copyright © 2016 Jordan Donald. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKShareKit
import FBSDKCoreKit

class LandingViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loginButton.layer.cornerRadius = 5
        registerButton.layer.cornerRadius = 5
        
        let fbLoginButton = FBSDKLoginButton()
        
        var y_pos = loginButton.frame.origin.y
        
        y_pos += 80
        
        fbLoginButton.frame = CGRectMake(68,CGFloat(y_pos),240,30)
        
        self.view.addSubview(fbLoginButton)
        fbLoginButton.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(sender: UIButton) {
    
        let rvc = RegistrationViewController(nibName: "RegistrationViewController", bundle: nil)
        self.navigationController?.pushViewController(rvc, animated: true)
        
    }
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        
        let email = emailField.text!
        let password = passwordField.text!
        
        let (error, _) = UserController.sharedInstance.loginUser(email, suppliedPassword: password)
        
        if let err = error {
            print(err)
        }
        else {
            
            let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.navigateToTable()
        }
    }

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
    }
    

}