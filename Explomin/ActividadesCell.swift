//
//  ActividadesCell.swift
//  Explomin
//
//  Created by Daniel López on 23/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class ActividadesCell: UITableViewCell {
    
    
    @IBOutlet weak var actividadLabel: UILabel!
    @IBOutlet weak var finLabel: UILabel!
    @IBOutlet weak var inicioLabel: UILabel!
    
    var total = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
      
        
    }
    
    
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
}
