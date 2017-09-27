//
//  SupervisorCell.swift
//  Explomin
//
//  Created by Daniel López on 25/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class SupervisorCell: UITableViewCell {

    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var mineraLabel: UILabel!
    @IBOutlet weak var negocioLabel: UILabel!
    @IBOutlet weak var perforistaLabel: UILabel!
    @IBOutlet weak var turnoLabel: UILabel!
    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var taladroLabel: UILabel!
    @IBOutlet weak var zonaLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
