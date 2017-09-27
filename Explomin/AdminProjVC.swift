//
//  AdminProjVC.swift
//  Explomin
//
//  Created by Daniel López on 20/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import Firebase

class AdminProjVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTable: UITableView!
    
    
    var arrayProyectos = [Proyecto]()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayProyectos = []
        fetchProjects()
        

        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print ("seleccionada", indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProyectoCell
        
        let user = arrayProyectos[indexPath.row]
        
        cell.clienteLabel.text = user.cliente
        cell.fechaLabel.text = user.fecha
        cell.nombreLabel.text = user.nombre
        cell.unidadLabel.text = user.uni
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayProyectos.count
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func fetchProjects(){
        
        
        ref = Database.database().reference()
        ref.child("explomin").child("ProyectoAdmin").observe(.value, with: { (snapshot) in
            
            print (snapshot)
            self.arrayProyectos = []
            
            
            for rest in snapshot.children.allObjects as! [DataSnapshot]{
            
                let cliente = rest.childSnapshot(forPath: "cliente").value as! String
                let fecha = rest.childSnapshot(forPath: "fecha").value as! String
                let nombre = rest.childSnapshot(forPath: "nombre").value as! String
                let unidad = rest.childSnapshot(forPath: "unidadNegocio").value as! String

                let proy = Proyecto(cliente: cliente, fecha: fecha, uni: unidad, nombre: nombre)
                
                self.arrayProyectos.append(proy)
            
            }
            
            self.myTable.reloadData()
        
        }
    
    
    )}
}
