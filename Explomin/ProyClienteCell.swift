//
//  ProyClienteCell.swift
//  Explomin
//
//  Created by Daniel López on 26/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class ProyClienteCell: UITableViewCell {

    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var unidadLabel: UILabel!
    @IBOutlet weak var fechaLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
