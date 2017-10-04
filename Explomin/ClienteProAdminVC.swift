//
//  ClienteProAdminVC.swift
//  Explomin
//
//  Created by Daniel López on 26/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import Firebase

class ClienteProAdminVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var empresa = String()
    var arrayProyectos = [[String:AnyObject]]()

    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        arrayProyectos = []
        empresa = Variables.empresaCli
        
    fetchProjAdmin()

    }
    
    private func setupNavigationBar(){
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "explo"))
        titleImageView.frame = CGRect(x:-57, y:0, width: 86, height: 30)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayProyectos.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
         let dir = arrayProyectos[indexPath.row]
        
        
        //let nombre = dir["nombre"] as? String
     // let fecha =  dir["fecha"] as? String
       // let unidad = dir["unidad"] as? String
         let key = dir["key"] as? String
        
        Variables.fkey = key!
        
        
        self.performSegue(withIdentifier: "segueform", sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dir = arrayProyectos[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProyClienteCell
        
        cell.nombreLabel.text = dir["nombre"] as? String
        cell.fechaLabel.text = dir["fecha"] as? String
        cell.unidadLabel.text = dir["unidad"] as? String
        cell.unidadLabel.text = dir["unidad"] as? String


        return cell
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func fetchProjAdmin(){
        
        //sacar el key del proyectoAdmin
        
    
        Database.database().reference().child("explomin").child("ProyectoAdmin").queryOrdered(byChild: "cliente").queryEqual(toValue: empresa).observe(.value, with: { (snapshot) in
            
            print(snapshot)
        
            for rest in snapshot.children.allObjects as! [DataSnapshot]{
            
                let fecha = rest.childSnapshot(forPath: "fecha").value as? String
                let nombre = rest.childSnapshot(forPath: "nombre").value as? String
                let unidad = rest.childSnapshot(forPath: "unidadNegocio").value as? String
                let mykey = rest.key //key de proyectoadmin
                
                let dic : [String:AnyObject] = ["nombre":nombre as AnyObject,"unidad":unidad as AnyObject,"fecha": fecha as AnyObject,"key":mykey as AnyObject]
                
                self.arrayProyectos.append(dic)
                
                

                
                
                
            }
            
            self.myTable.reloadData()
            
        })
    
    }
    
    



}
