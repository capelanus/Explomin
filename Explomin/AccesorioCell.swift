//
//  AccesorioCell.swift
//  Explomin
//
//  Created by Daniel López on 24/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class AccesorioCell: UITableViewCell {

    
    
    @IBOutlet weak var accesorioLabel: UILabel!
    
    @IBOutlet weak var unidadLabel: UILabel!
    @IBOutlet weak var cantidadLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
