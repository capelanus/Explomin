//
//  CorridaCell.swift
//  Explomin
//
//  Created by Daniel López on 16/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class CorridaCell: UITableViewCell {

    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
