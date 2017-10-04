//
//  ClienteMaterialesCell.swift
//  Explomin
//
//  Created by Daniel López on 4/10/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class ClienteMaterialesCell: UITableViewCell {

    @IBOutlet weak var materialLabel: UILabel!
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
