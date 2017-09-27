//
//  ProyectoCell.swift
//  Explomin
//
//  Created by Daniel López on 21/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class ProyectoCell: UITableViewCell {

    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var clienteLabel: UILabel!
    @IBOutlet weak var unidadLabel: UILabel!
    @IBOutlet weak var fechaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
