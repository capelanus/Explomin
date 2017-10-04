//
//  ClienteAditivoVC.swift
//  Explomin
//
//  Created by Daniel López on 4/10/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class ClienteAditivoVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   var aditivos = [[String:AnyObject]]()

    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

      
        aditivos = Variables.faditivos
        
    }

 

}
