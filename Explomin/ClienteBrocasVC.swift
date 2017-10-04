//
//  ClienteBrocasVC.swift
//  Explomin
//
//  Created by Daniel López on 4/10/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class ClienteBrocasVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var brocas = [[String : AnyObject]]()
    
    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brocas = Variables.fbrocas
        print(brocas)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ClienteBrocaCell
        
        let res = brocas[indexPath.row]
        
        cell.diametroLabel.text = res["diametro"] as? String
        cell.estadoLabel.text = res["estado"] as? String
        cell.hastaLabel.text = res["hasta"] as? String
        cell.marcaLabel.text = res["marca"] as? String
        cell.serieLabel.text = res["serie"] as? String
        cell.tipoLabel.text = res["tipo"] as? String
        cell.desdLabel.text = res["desde"] as? String

        
        
        
        
        return cell
    
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brocas.count
    }
    
  

}
