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
    var username_new = ""
    var password_new = ""
    var username_list = ["lucas"]
    var password_list = ["123456"]
    var indexOfUser: Int!
    

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
            if username_list.contains(username.text!) == false {
                let alert = UIAlertController(title: "Login Failed!", message: "Your username doesn't exist!", preferredStyle: .alert)

                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)

                alert.addAction(okAction)

                self.present(alert, animated: true, completion: nil)
            }
            else {
                indexOfUser = username_list.firstIndex(of: username.text!)
                
                if username.text == username_list[indexOfUser] && password.text == password_list[indexOfUser] {
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
        
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        performSegue(withIdentifier: "SignupLink", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignupLink" {
            let nextVC = segue.destination as! SignupView
            
            nextVC.callback1 = {message in
                self.username_new = message
                self.username_list.append(self.username_new)
            }
            
            nextVC.callback2 = {message in
                self.password_new = message
                self.password_list.append(self.password_new)
            }
            
            
        }
    }

}

