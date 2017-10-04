//
//  FormularioSup VC.swift
//  Explomin
//
//  Created by Daniel López on 25/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import Firebase

class FormularioSup_VC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var nombre = String()
    var arraySup = [AnyObject]()
    var dic = [String:AnyObject]()
    

    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.reloadData()
        setupNavigationBar()
        

    }
    
    private func setupNavigationBar(){
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "explo"))
        titleImageView.frame = CGRect(x:-57, y:0, width: 86, height: 30)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        nombre = UserDefaults.standard.value(forKey: "nombre") as! String
        
        dic = [:]
        
        fetchForm()
        arraySup = []
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraySup.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let doc = arraySup[indexPath.row]
        
        let key = doc["key"] as? String
        Variables.keyxs = key!
        
        self.performSegue(withIdentifier: "seguesup", sender: self)
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SupervisorCell
        
        let doc = arraySup[indexPath.row]
        
        cell.nombreLabel.text = doc["nombre"] as? String
        cell.mineraLabel.text = doc["minera"] as? String
        cell.negocioLabel.text = doc["negocio"] as? String
        cell.perforistaLabel.text = doc["perforista"] as? String
        cell.turnoLabel.text = doc["turno"] as? String
        cell.fechaLabel.text = doc["fecha"] as? String
        cell.taladroLabel.text = doc["taladro"] as? String
        cell.zonaLabel.text = doc["zona"] as? String

        
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    
    
    
    
    
    
    func fetchForm(){
    
    ref = Database.database().reference()
    ref.child("explomin").child("Formularios2").queryOrdered(byChild:"id").queryEqual(toValue: "no").observe(
        .value, with: { (snapshot) in
            
            
            //print(snapshot)
            
            for rest in snapshot.children.allObjects as! [DataSnapshot]{
            
                let supervisor = rest.childSnapshot(forPath: "supervisor").value as! String

                if supervisor == self.nombre{
                    
                     let key = rest.key
                     let nombre1 = rest.childSnapshot(forPath: "nombreproyecto").value as! String
                     let minera1 = rest.childSnapshot(forPath: "minera").value as! String
                     let negocio1 = rest.childSnapshot(forPath: "unidad de negocio").value as! String
                     let perforista1 = rest.childSnapshot(forPath: "perforista").value as! String
                     let turno1 = rest.childSnapshot(forPath: "turno").value as! String
                    let fecha1 = rest.childSnapshot(forPath: "fecha").value as! String
                    let taladro1 = rest.childSnapshot(forPath: "taladro").value as! String
                    let zona1 = rest.childSnapshot(forPath: "zona").value as! String
                    
                    
                    self.dic  = ["nombre": nombre1 as AnyObject, "minera": minera1 as AnyObject, "negocio": negocio1 as AnyObject, "perforista":perforista1 as AnyObject, "turno": turno1 as AnyObject, "fecha": fecha1 as AnyObject, "taladro":taladro1 as AnyObject, "zona":zona1 as AnyObject, "key": key as AnyObject]
                    
                    self.arraySup.append(self.dic as AnyObject)
                    
                    
                }
            
            }
            
            //print(self.arraySup)
            self.myTable.reloadData()

            
        }
    
    
    
    
    )}


}
