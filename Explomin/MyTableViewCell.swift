//
//  MyTableViewCell.swift
//  Explomin
//
//  Created by Daniel López on 12/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit


class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
