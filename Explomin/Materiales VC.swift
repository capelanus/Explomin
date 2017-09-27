//
//  Materiales VC.swift
//  Explomin
//
//  Created by Daniel López on 23/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit


class Materiales_VC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayMateriales = [[:]]

    
    @IBOutlet weak var materialTextField: UITextField!
    @IBOutlet weak var cantidadTextField: UITextField!
    @IBOutlet weak var myTable: UITableView!
    
    var mat = [String : AnyObject]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        arrayMateriales = []
        
        // Do any additional setup after loading the view.
    }
    
   

    @IBAction func addMaterial(_ sender: Any) {
        
        let material = self.materialTextField.text
        let cantidad = self.cantidadTextField.text


        mat = ["nombre" : material as AnyObject, "cantidad": cantidad as AnyObject]
        
        
        self.arrayMateriales.append(mat)

        self.myTable.reloadData()
        
        self.materialTextField.text = ""
        self.cantidadTextField.text = ""
        
    }
 
    @IBAction func send(_ sender: Any) {
        
        
        Variables.matx2 = arrayMateriales
        dismiss(animated: true, completion: nil)
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MaterialCell
        
        let material  = arrayMateriales[indexPath.row]
        
        cell.nombreLabel.text = material["nombre"] as? String
        cell.cantidadLabel.text = material["cantidad"] as? String
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayMateriales.count
    }
    
 
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    @IBAction func print(_ sender: Any) {
        
       
    }
}
