//
//  ClienteFormDetailVC.swift
//  Explomin
//
//  Created by Daniel López on 4/10/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import Firebase

class ClienteFormDetailVC: UIViewController {
    
    
    
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var mineraLabel: UILabel!
    @IBOutlet weak var unidadLabel: UILabel!
    
    @IBOutlet weak var perforistaLabel: UILabel!
    
    @IBOutlet weak var supervisorLabel: UILabel!
    
    @IBOutlet weak var ayu1Label: UILabel!
    @IBOutlet weak var ayu2Label: UILabel!
    
    
    @IBOutlet weak var zonaLabel: UILabel!
    @IBOutlet weak var taladroLabel: UILabel!
    @IBOutlet weak var inclinacionLabel: UILabel!
    @IBOutlet weak var azimutLabel: UILabel!
    
    
    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var turnoLabel: UILabel!
    
    
    
    @IBOutlet weak var maquinaLabel: UILabel!
    @IBOutlet weak var galonesLabel: UILabel!
    
    
    @IBOutlet weak var minicialLabel: UILabel!
    @IBOutlet weak var mfinalLabel: UILabel!
    
    @IBOutlet weak var tiempoiLabel: UILabel!
    @IBOutlet weak var tiempofLabel: UILabel!
    
    
    
    
    
    var gkey = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        gkey = Variables.gkey

        fetchForm()
    
    
    }
    
    func fetchForm(){
    
        Database.database().reference().child("explomin").child("Formularios2").child(gkey).observe(.value, with: { (snapshot) in
        
        print(snapshot)
            
            for childSnap in  snapshot.children.allObjects {
                
                let snap = childSnap as! DataSnapshot
                
                if let snapshotValue = snapshot.value as? NSDictionary, let snapVal = snapshotValue[snap.key]  {
                    
                    //print(snap.key, "=" , snapVal)
                    
                    
                    
                    if snap.key == "ayudante1"{
                        
                        self.ayu1Label.text = snapVal as? String
                        
                    }
                    
                    
                    
                    if snap.key == "ayudante2"{
                        
                        self.ayu2Label.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "azimut"{
                        
                        self.azimutLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "combustible"{
                        
                        self.galonesLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "fecha"{
                        
                        self.fechaLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "horometro final"{
                        
                         self.tiempofLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "horometro inicial"{
                        
                         self.tiempoiLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "inclinacion"{
                        
                         self.inclinacionLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "maquina"{
                        
                        self.maquinaLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "metraje final"{
                        
                         self.mfinalLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "metraje inicial"{
                        
                         self.minicialLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "minera"{
                        
                         self.mineraLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "nombreproyecto"{
                        
                         self.nombreLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "perforista"{
                        
                         self.perforistaLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "supervisor"{
                        
                         self.supervisorLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "taladro"{
                        
                         self.taladroLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "turno"{
                        
                         self.turnoLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "unidad de negocio"{
                        
                         self.unidadLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "zona"{
                        
                         self.zonaLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "aditivos"{
                        
                        Variables.faditivos = (snapVal as? [[String : AnyObject]])!
                        print(snapVal)
                        
                        
                    }
                    if snap.key == "accesorios"{ //accesorios es diccionario, verificar si está vacío!!!
                        
                        Variables.faccesorios = (snapVal as? [[String : AnyObject]])!
                        
                    }
                    if snap.key == "actividades"{ //actividades es diccionario, verificar si está vacío!!
                        
                        Variables.factividades = (snapVal as? [[String : AnyObject]])!
                        
                    }
                    
                    if snap.key == "brocas"{
                        
                        Variables.fbrocas = (snapVal as? [[String : AnyObject]])!
                        
                    }
                    if snap.key == "corrida"{
                        
                        Variables.fcorridas = (snapVal as? [[String : AnyObject]])!
                    }
                    if snap.key == "materialesPerdidos"{
                        
                        Variables.fmateriales = (snapVal as? [[String : AnyObject]])!
                    }
                    
                    
                 
                
                
                }
        
            }
        
        }
            )
    
    
    

}

}



