//
//  Proyecto1Cell.swift
//  Explomin
//
//  Created by Daniel López on 14/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class Proyecto1Cell: UITableViewCell {

    @IBOutlet weak var namepLabel: UILabel!
    @IBOutlet weak var nameMinLabel: UILabel!
    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var uniNegLabel: UILabel!
    @IBOutlet weak var diametroLabel: UILabel!
    @IBOutlet weak var profundidadLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
