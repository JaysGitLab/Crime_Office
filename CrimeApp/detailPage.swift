//
//  detailPage.swift
//  CrimeApp
//
//  Created by lucas on 10/31/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

var comments = [["This is so bad!", "It must be cleaned", "I think this is done by John"], ["The dishes suck!", "Who did this?", "Oh my god"], ["I can't work without the desk!", "I guess the boss should replace this one"], ["Somebody cleans it, please!", "I won't use this kitchen ever!"]]

class detailPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var detailDescription: UITextField!
    @IBOutlet var commentTableView: UITableView!
    
    
    var receivedItem: Int!
    var mainArray = ["The coffee machine is used", "The dishes hasn't been washed", "The desk is meessed up", "The kitchen is dirty"]
    var detailArray = ["Bad coffee machine", "Dirty dishes", "Bad desk", "Dirty kitchen"]
    var imageArray = ["appstore.png", "arcade.png", "facetime.png", "tv.png"]
    let cellID = "cellID"
    var special_comments = [""]
    var new_comment = ""

    override func viewDidLoad() {
        super.viewDidLoad()

//      Do any additional setup after loading the view.
        detailImage.image = UIImage(named: self.imageArray[receivedItem])
        detailDescription.text = self.mainArray[receivedItem]
        commentTableView.delegate = self
        commentTableView.dataSource = self
        special_comments = comments[receivedItem]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return special_comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = commentTableView.dequeueReusableCell(withIdentifier: cellID)
        
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = special_comments[indexPath.row]
        return cell!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func addComment(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addCommentLink", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addCommentLink" {
            let nextVC = segue.destination as! addCommentPage
            
            nextVC.callback = {message in
                self.new_comment = message
                
                comments[self.receivedItem].append(message)
                self.special_comments = comments[self.receivedItem]
                self.commentTableView.reloadData()
            }
        }
    }
    

}
