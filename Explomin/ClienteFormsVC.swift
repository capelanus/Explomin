//
//  ClienteFormsVC.swift
//  Explomin
//
//  Created by Daniel López on 4/10/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import Firebase

class ClienteFormsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var key = String()
    var arrayForm = [[String:AnyObject]]()

    @IBOutlet weak var myTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        key = Variables.fkey
        fetchForms()
        arrayForm = []


    }
    
    func fetchForms(){
    
        Database.database().reference().child("explomin").child("Formularios2").queryOrdered(byChild: "proyecto").queryEqual(toValue: key).observe(.value, with: { (snapshot) in
        
            print(snapshot)
            
            for rest in snapshot.children.allObjects as! [DataSnapshot]{
            
                let nombrez = rest.childSnapshot(forPath: "nombreproyecto").value as? String
                
                let taladroz = rest.childSnapshot(forPath: "taladro").value as? String
                
                let unidadz = rest.childSnapshot(forPath: "unidad de negocio").value as? String
                let fechaz = rest.childSnapshot(forPath: "fecha").value as? String
                
                let turnoz = rest.childSnapshot(forPath: "turno").value as? String

                let mykeyz = rest.key //key de formulario
                
                
                 let dic : [String:AnyObject] = ["nombre":nombrez as AnyObject,"taladro":taladroz as AnyObject,"unidad":unidadz as AnyObject, "fecha":fechaz as AnyObject,"turno":turnoz as AnyObject,"mykey":mykeyz as AnyObject]
                
                print("keyyyyyy", mykeyz)
                
                self.arrayForm.append(dic)
                
                print("otro array",self.arrayForm)

                
                
                

            
            
            }
            
            self.myTable.reloadData()

        })
        
        
    
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dir = arrayForm[indexPath.row]

        let key = dir["mykey"] as? String
        
        Variables.gkey = key!
        
        self.performSegue(withIdentifier: "gogogo", sender: self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
return 1
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayForm.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ClienteFormCell
        
        
        let dir = arrayForm[indexPath.row]
        
        cell.nombreLabel.text = dir["nombre"] as? String
        cell.taladroLabel.text = dir["taladro"] as? String
        cell.unidadLabel.text = dir["unidad"] as? String
        cell.fechaLabel.text = dir["fecha"] as? String
        cell.turnoLabel.text = dir["turno"] as? String
      
        
        // = dir["nombre"] as? String

        
        
        
        return cell
        
        
    }



}
