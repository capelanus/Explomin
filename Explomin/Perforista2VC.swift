//
//  Perforista2VC.swift
//  Explomin
//
//  Created by Daniel López on 21/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import Firebase

class Perforista2VC: UIViewController {

    var myKey = String()
    
    var cliente = String()
    var fecha = String()
    var nombre = String()
    var negocio = String()
    var actividades = [String]()
    var equipos = [String]()
    var keyz = String()

    
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var negocioLabel: UILabel!
    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var mineraLabel: UILabel!
    
    
    func load(){
        
        nombreLabel.text = self.nombre
        negocioLabel.text = self.negocio
        fechaLabel.text = self.fecha
        mineraLabel.text = self.cliente
        
        Variables.actix3 = self.actividades
        Variables.maquix3 = self.equipos
        
        //INSERTAR EN VARIABLES LA MINERA, UNIDAD DE NEGOCIO, NOMBRE DEL PROYECTO/
        
        Variables.minera = self.cliente
        Variables.negocio = self.negocio
        Variables.nombreproy = self.nombre
         Variables.keyq =  self.keyz
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

        
        myKey = Variables.key
        fetchProject()
    
    }

    func fetchProject(){
        
       // print("entra")
    
        ref = Database.database().reference()
        ref.child("explomin").child("ProyectoAdmin").child(myKey).observe(.value, with: { (snapshot) in
            
        //print(snapshot)
           
       
            for childSnap in  snapshot.children.allObjects {
                
                let snap = childSnap as! DataSnapshot
                
                if let snapshotValue = snapshot.value as? NSDictionary, let snapVal = snapshotValue[snap.key]  { // aqui había un as? anyobject desùes del corchete cerrado
                    
                    //print(snap.key)
                      print(snap.key, "=" , snapVal)
                    
                    if snap.key == "cliente"{
                    
                        self.cliente = snapVal as! String
                    
                    }
                    if snap.key == "fecha"{
                        
                        self.fecha = snapVal as! String
                        
                    }
                    if snap.key == "nombre"{
                        
                        self.nombre = snapVal as! String
                        
                    }
                    if snap.key == "unidadNegocio"{
                        
                        self.negocio = snapVal as! String
                        
                    }
                    
                    if snap.key == "actividades"{
                        
                        self.actividades = snapVal as! [String]
                        
                    }
                    
                   if snap.key == "equipos"{
                        
                        self.equipos = snapVal as! [String]
                        
                    }
                    
                    if snap.key == "key"{
                        
                        self.keyz = snapVal as! String
                        
                    }
                    
                    print(self.actividades)
                    print(self.equipos)

                    
                }
            }
            
    self.load()
    
    })

}
    
  
    
    
    
    
    
    
}
