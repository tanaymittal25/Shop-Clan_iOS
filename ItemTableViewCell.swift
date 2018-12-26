//
//  ItemTableViewCell.swift
//  Task Manager
//
//  Created by CAMSMAC on 19/12/18.
//  Copyright © 2018 cams. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var label_Name: UILabel!
    @IBOutlet weak var label_Price: UILabel!
    @IBOutlet weak var label_Desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
