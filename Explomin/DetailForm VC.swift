//
//  DetailForm VC.swift
//  Explomin
//
//  Created by Daniel López on 25/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import Firebase




class DetailForm_VC: UIViewController {
    
    var key = String()
    var min2 = String()
    
    
    @IBOutlet weak var proyectoLabel: UILabel!
    @IBOutlet weak var mineraLabel: UILabel!
    @IBOutlet weak var unidadLabel: UILabel!
    @IBOutlet weak var fechaLabel: UILabel!
    @IBOutlet weak var turnoLabel: UILabel!
    
    @IBOutlet weak var perfLabel: UILabel!
    @IBOutlet weak var ayu1Label: UILabel!
    @IBOutlet weak var ayu2Label: UILabel!
    @IBOutlet weak var zonaLabel: UILabel!
    @IBOutlet weak var taladroLabel: UILabel!
    
    @IBOutlet weak var aziLabel: UILabel!
    @IBOutlet weak var incliLabel: UILabel!
    @IBOutlet weak var maquiLabel: UILabel!
    @IBOutlet weak var gasLabel: UILabel!
    @IBOutlet weak var met1Label: UILabel!
    
    @IBOutlet weak var met2Label: UILabel!
    @IBOutlet weak var tiem1Label: UILabel!
    @IBOutlet weak var tiem2Label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.key = Variables.keyxs
        
        fetchForm()
        

    }
    
    
    
    
    
    func fetchForm(){
        
        
         
        
        
    
        Database.database().reference().child("explomin").child("Formularios2").child(key).observe(.value, with: { (snapshot) in
            
         print(snapshot)
            
            for childSnap in  snapshot.children.allObjects {
                
                let snap = childSnap as! DataSnapshot
                
                if let snapshotValue = snapshot.value as? NSDictionary, let snapVal = snapshotValue[snap.key]  {
                    
                    
                    
                    
                    if snap.key == "ayudante1"{
                        
                        self.ayu1Label.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "ayudante2"{
                        
                        self.ayu2Label.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "azimut"{
                        
                        self.aziLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "combustible"{
                        
                        self.gasLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "fecha"{
                        
                        self.fechaLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "horometro final"{
                        
                        self.tiem1Label.text = snapVal as? String
                        
                    }
                    if snap.key == "horometro inicial"{
                        
                        self.tiem2Label.text = snapVal as? String
                        
                    }
                    if snap.key == "inclinacion"{
                        
                        self.incliLabel.text = snapVal as? String
                        
                    }
                    if snap.key == "metraje final"{
                        
                        self.met2Label.text = snapVal as? String
                        
                    }
                    if snap.key == "metraje inicial"{
                        
                        self.met1Label.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "minera"{
                        
                        self.mineraLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "nombreproyecto"{
                        
                        self.proyectoLabel.text = snapVal as? String
                        
                    }
                    
                    if snap.key == "perforista"{
                        
                        self.perfLabel.text = snapVal as? String
                        
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
                    
                    if snap.key == "accesorios"{
                        
                       // Variables.acc4 = snapVal as? [String]
                        
                    }
                    if snap.key == "actividades"{
                        
                         Variables.acti4 = (snapVal as? [String])!
                        
                    }
                    if snap.key == "aditivos"{
                        
                        Variables.adi4 = (snapVal as? [String])!
                        
                    }
                    if snap.key == "brocas"{
                        
                         Variables.bro4 = (snapVal as? [String])!
                        
                    }
                    if snap.key == "corrida"{
                        
                        Variables.mue4 = (snapVal as? [String])!
                        
                    }
                    if snap.key == "materialesPerdidos"{
                        
                        Variables.mat4 = (snapVal as? [String])!
                        
                    }
                    
                  
    
            
                }

    
            
            }
        }
            
            )
            
     


        }
    
    
    @IBAction func validar(_ sender: Any) {
        
        
        
        Database.database().reference().child("explomin").child("Formularios2").child(key).child("id").setValue("ok")
        
        
        
        dismiss(animated: true, completion: nil)
        
    }
    

}




                
    
    
    

    

