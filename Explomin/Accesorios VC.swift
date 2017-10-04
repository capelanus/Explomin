//
//  Accesorios VC.swift
//  Explomin
//
//  Created by Daniel López on 24/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class Accesorios_VC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayAccesorios = [[:]]
    
    
    @IBOutlet weak var accesorioTextField: UITextField!
    
    @IBOutlet weak var cantidadTextFIeld: UITextField!
    @IBOutlet weak var unidadesTextField: UITextField!
    
    @IBOutlet weak var ok: UIButton!
    @IBOutlet weak var myTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayAccesorios = []
        ok.layer.cornerRadius = 10
        ok.clipsToBounds = true
    
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AccesorioCell
        
        let dea = arrayAccesorios[indexPath.row]
        
        cell.accesorioLabel.text = dea["accesorio"] as? String
        cell.unidadLabel.text = dea["unidad"] as? String
        cell.cantidadLabel.text = dea["cantidad"] as? String
        
        return cell

        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayAccesorios.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    @IBAction func add(_ sender: Any) {
        
        let acc = self.accesorioTextField.text
        let cant = self.cantidadTextFIeld.text
        let uni = self.unidadesTextField.text

        let sae : [String : AnyObject] = ["accesorio":acc as AnyObject,"unidad":cant as AnyObject,"cantidad":uni as AnyObject]
        
        arrayAccesorios.append(sae)
        
        
        self.accesorioTextField.text = ""
        self.cantidadTextFIeld.text = ""
        self.unidadesTextField.text = ""

        
        self.myTable.reloadData()
        
        
    }
    @IBAction func send(_ sender: Any) {
        
        
        Variables.accex2 = arrayAccesorios

        dismiss(animated: true, completion: nil)
        
    }


}
