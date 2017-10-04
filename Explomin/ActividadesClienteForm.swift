//
//  ActividadesClienteForm.swift
//  Explomin
//
//  Created by Daniel López on 4/10/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import Firebase

class ActividadesClienteForm: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var activi = [[String : AnyObject]]()

    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        activi = Variables.factividades
        print(activi)

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CliActCell
        
        let res = activi[indexPath.row]
        
        cell.actividadLabel.text = res["actividad"] as? String
        cell.desdeLabel.text = res["inicio"] as? String
        cell.hastaLabel.text = res["final"] as? String
        
        return cell

        
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return activi.count
    }

}
