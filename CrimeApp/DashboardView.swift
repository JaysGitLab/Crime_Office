//
//  DashboardView.swift
//  CrimeApp
//
//  Created by lucas on 10/31/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class DashboardView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mainArray = ["The coffee machine is used", "The dishes hasn't been washed", "The desk is meessed up", "The kitchen is dirty"]
    var detailArray = ["Bad coffee machine", "Dirty dishes", "Bad desk", "Dirty kitchen"]
    var imageArray = ["appstore.png", "arcade.png", "facetime.png", "tv.png"]
    var selectedItem = 0
    
    @IBOutlet var eventTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        eventTableView.dataSource = self
        eventTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! TableViewCell
        
        cell.mainLabel?.text = self.detailArray[indexPath.row]
        cell.detailCell?.text = self.mainArray[indexPath.row]
        cell.imageView?.image = UIImage(named: self.imageArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = indexPath.row
        performSegue(withIdentifier: "showDetailLink", sender: self)

    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: UIContextualAction.Style.normal, title: "Delete", handler: {(contextualAction, view, boolValue) in
                self.mainArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        })
        
        deleteAction.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailLink" {
            let nextVC = segue.destination as! detailPage
            nextVC.receivedItem = selectedItem
        }
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
