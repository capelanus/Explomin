//
//  ClienteMaterialesVC.swift
//  Explomin
//
//  Created by Daniel López on 4/10/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class ClienteMaterialesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var materiales = [[String : AnyObject]]()

    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        materiales = Variables.fmateriales
    print(materiales)
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ClienteMaterialesCell
        
        let res = materiales[indexPath.row]
        
        cell.cantidadLabel.text = res["cantidad"] as? String
        cell.materialLabel.text = res["nombre"] as? String

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materiales.count
    }
  

}
