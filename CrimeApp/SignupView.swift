//
//  SignupView.swift
//  CrimeApp
//
//  Created by lucas on 10/31/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class SignupView: UIViewController {
    
    @IBOutlet var usernameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var confirmText: UITextField!
    
    var callback1: ((String) -> Void)?
    var callback2: ((String) -> Void)?
    var username = ""
    var password = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func Register(_ sender: UIButton) {
        
        if usernameText.text == "" || passwordText.text == "" {
            let emptyAlert = UIAlertController(title: "Register failed!", message: "You can't register with an empty username or password", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            emptyAlert.addAction(okAction)
            
            self.present(emptyAlert, animated: true, completion: nil)
        }
        else if passwordText.text != confirmText.text{
            let errorAlert = UIAlertController(title: "The passwords are not the same!", message: "Make sure you entered the same password", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            errorAlert.addAction(okAction)
            
            self.present(errorAlert, animated: true, completion: nil)
        }
        
        else {
            
            username = usernameText.text!
            password = passwordText.text!
            
            callback1?(username)
            callback2?(password)
            self.dismiss(animated: true, completion: nil)
            
            let sucessAlert = UIAlertController(title: "Register Success!", message: "Thanks for register, \(usernameText.text!)", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default, handler: {Void in
                self.navigationController?.popToRootViewController(animated: true)
            })

            sucessAlert.addAction(okAction)

            self.present(sucessAlert, animated: true, completion: nil)
            
            
        }
    }
    

}
