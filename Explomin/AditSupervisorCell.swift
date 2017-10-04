//
//  AditSupervisorCell.swift
//  Explomin
//
//  Created by Daniel López on 29/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class AditSupervisorCell: UITableViewCell {

    @IBOutlet weak var aditivoTextField: UITextField!
    @IBOutlet weak var cantidadTextField: UITextField!
    @IBOutlet weak var unidadLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
