//
//  ViewController.swift
//  CrimeApp
//
//  Created by lucas on 10/31/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signinAction(_ sender: UIButton) {
        if username.text == "" || password.text == "" {
            let alert = UIAlertController(title: "Login Failed!", message: "You can't login with empty username or password", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if username.text == "lucas" && password.text == "123456" {
                performSegue(withIdentifier: "SigninLink", sender: self)
                
                let alert = UIAlertController(title: "Login Successful!", message: "Hello, \(username.text!)", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alert.addAction(okAction)
                
                self.present(alert, animated: true, completion: nil)
            }
            else {
                let alert = UIAlertController(title: "Login Failed!", message: "Wrong username or password", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alert.addAction(okAction)
                
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        performSegue(withIdentifier: "SignupLink", sender: self)
    }
    

}

