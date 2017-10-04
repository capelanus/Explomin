//
//  ClienteMuestrasVC.swift
//  Explomin
//
//  Created by Daniel López on 4/10/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class ClienteMuestrasVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var muestras = [[String:AnyObject]]()

    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()


            muestras = Variables.fcorridas
        print(muestras)
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ClienteMuestraCell
        
        let res = muestras[indexPath.row]

        cell.desdeLabel.text = res["desde"] as? String
        cell.hastaLabel.text = res["hasta"] as? String
        cell.longLabel.text = res["longitud"] as? String
        
      //  let des = res["desde"] as? String
       // let has = res["hasta"] as? String
       // let lon = res["longitus"] as? String
        
      /*  let des1 = Int(des!)
        let has1 = Int(has!)
        let lon1 = Int(lon!)
        
        let tot = (lon1! * 100)/(has1!-des1!)
        
        let tot1 = String(tot)
        
        cell.pocentajeLabel.text = tot1*/
        

        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return muestras.count
    }
 
}
