//
//  RegistrationViewController.swift
//  Tortoise
//
//  Created by Jordan Donald on 6/20/16.
//  Copyright © 2016 Jordan Donald. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        registerButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginButtonTapped(sender: UIButton) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func registrationButtonTapped(sender: UIButton) {
        
        let email = emailField.text!
        let password = passwordField.text!
        
        let (error, _) = UserController.sharedInstance.registerUser(email, newPassword: password)
        
        if let err = error {
            print(err)
        }
        else {
            
            let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.navigateToTable()
            
        }
      

    }
    
//    func registrationComplete(user:User?,message:String?) {
//        
//        if let _ = user   {
//            
//            //successfully registered
//            let alert = UIAlertController(title:"Registration Successful", message:"You will now be logged in", preferredStyle: UIAlertControllerStyle.Alert)
//            let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {(action) in
//                //when the user clicks "Ok", do the following
//                let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//                appDelegate.navigateToBoardViewController()
//            })
//            alert.addAction(action)
//            self.presentViewController(alert, animated: true, completion: nil)
//            
//        }   else    {
//            
//            //registration failed
//            let alert = UIAlertController(title:"Registration Failed", message:message!, preferredStyle: UIAlertControllerStyle.Alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
//            self.presentViewController(alert, animated: true, completion: {
//                
//            })
//            
//        }
//    }

    

}
