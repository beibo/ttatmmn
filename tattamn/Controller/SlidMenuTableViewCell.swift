//
//  SlidMenuTableViewCell.swift
//  tattamn
//
//  Created by heba sami on 7/12/18.
//  Copyright © 2018 heba sami. All rights reserved.
//

import UIKit

class SlidMenuTableViewCell: UITableViewCell {

 
    @IBOutlet weak var tableview:UITableView!
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      
        
        
        // Configure the view for the selected state
    }

}
