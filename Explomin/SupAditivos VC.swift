//
//  SupAditivos VC.swift
//  Explomin
//
//  Created by Daniel López on 26/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit


class SupAditivos_VC: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
   
 
    var array2 = [String]()
    var array3 = [String]()
    var array4 = [String]()
    
    var array5 = [String]()
    var array6 = [String]()
    var array7 = [String]()

    
    var nexo = [[:]]
    

    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
            nexo = []
            nexo = Variables.adi4
        
        print(nexo)
     
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AditSupervisorCell
        
        let nexo1 = nexo[indexPath.row]
        
        cell.aditivoTextField.text = nexo1["nombre"] as? String
        cell.unidadLabel.text = nexo1["unidades"] as? String
        cell.cantidadTextField.text = nexo1["cantidad"] as? String
        
        
        
        return cell
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
            return nexo.count
    
    }
    
    
    @IBAction func compare(_ sender: Any) {
        
      
        for j in 0...myTable.numberOfSections-1 {
        
            for i in 0...myTable.numberOfRows(inSection: j){
                
                let index = IndexPath(row : i, section: j)
            
                if let cell = myTable.cellForRow(at: index) as? AditSupervisorCell{
                    
                    let hun = nexo[i]
                    
                    let nombre = hun["nombre"] as? String
                    let unidades = hun["unidades"] as? String
                    let cantidades = hun["cantidad"] as? String

                    self.array5.append(nombre!)
                    self.array6.append(unidades!)
                    self.array7.append(cantidades!)
                
                    let www = cell.aditivoTextField.text
                    let xxx = cell.cantidadTextField.text
                    let sss = cell.unidadLabel.text
                
                    self.array2.append(www!)
                    self.array3.append(xxx!)
                    self.array4.append(sss!)

                    
                }
            
            }
        
        }
        
        print(array2)
        print(array3)
        print(array4)
        
        print(array5)
        print(array6)
        print(array7)

        
        
        
        
    }
    
    
    

}
