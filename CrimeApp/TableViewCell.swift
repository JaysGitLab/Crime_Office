//
//  TableViewCell.swift
//  CrimeApp
//
//  Created by lucas on 10/31/20.
//  Copyright © 2020 lucas. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var detailCell: UILabel!
    @IBOutlet var cellImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
