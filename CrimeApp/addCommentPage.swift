//
//  addCommentPage.swift
//  CrimeApp
//
//  Created by lucas on 11/7/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class addCommentPage: UIViewController {
    
    @IBOutlet var commentText: UITextField!
    var callback: ((String) -> Void)?
    var comment = ""

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
    
    @IBAction func submitButton(_ sender: UIButton) {
        if commentText.text == "" {
            let emptyAlert = UIAlertController(title: "Register failed!", message: "You can't submit with an empty comment", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            emptyAlert.addAction(okAction)
            
            self.present(emptyAlert, animated: true, completion: nil)
        }
        else {
            comment = commentText.text!
            callback?(comment)
            
            self.dismiss(animated: true, completion: nil)
            
            let sucessAlert = UIAlertController(title: "Comment Success!", message: "Thanks for comment!", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default, handler: {Void in
                self.navigationController?.popViewController(animated: true)
            })

            sucessAlert.addAction(okAction)

            self.present(sucessAlert, animated: true, completion: nil)
            
        }
    }
    

}
