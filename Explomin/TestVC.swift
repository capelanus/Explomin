//
//  TestVC.swift
//  Explomin
//
//  Created by Daniel López on 26/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import Firebase

class TestVC: UIViewController {
    
    var key = String()

    override func viewDidLoad() {
        super.viewDidLoad()


        key = "-KutOK9Ao8iVFA3n7OwL"
 
        fetchForm()
    }
    
    func fetchForm(){
    
        Database.database().reference().child("explomin").child("Formularios2").child(key).observe(.value, with: { (snapshot) in
            
            
                let o = snapshot.childSnapshot(forPath: "ayudante1")
            
                print(o)
            
        
            
        }
    
    )}

   

}

/*  let ayu2 = rest.childSnapshot(forPath: "ayudante2").value as! String
 let azi = rest.childSnapshot(forPath: "azimut").value as! String
 let gas = rest.childSnapshot(forPath: "combustible").value as! String
 let fecha = rest.childSnapshot(forPath: "fecha").value as! String
 
 let hini = rest.childSnapshot(forPath: "horometro final").value as! String
 let hfin = rest.childSnapshot(forPath: "horometro inicial").value as! String
 let incli = rest.childSnapshot(forPath: "inclinacion").value as! String
 let mfin = rest.childSnapshot(forPath: "metraje final").value as! String
 let mini = rest.childSnapshot(forPath: "metraje inicial").value as! String
 
 let minera = rest.childSnapshot(forPath: "minera").value as! String
 let proyec = rest.childSnapshot(forPath: "nombreproyecto").value as! String
 let perforista = rest.childSnapshot(forPath: "perforista").value as! String
 let taladro = rest.childSnapshot(forPath: "taladro").value as! String
 let turno = rest.childSnapshot(forPath: "turno").value as! String
 
 let unidad = rest.childSnapshot(forPath: "unidad de negocio").value as! String
 let zona = rest.childSnapshot(forPath: "zona").value as! String
 
 
 
 
 self.proyectoLabel.text = proyec
 self.mineraLabel.text = minera
 self.unidadLabel.text = unidad
 self.fechaLabel.text = fecha
 self.turnoLabel.text = turno
 
 self.perfLabel.text = perforista
 self.ayu2Label.text = ayu2
 self.zonaLabel.text = zona
 self.taladroLabel.text = taladro
 
 self.aziLabel.text = azi
 self.incliLabel.text = incli
 self.maquiLabel.text =
 self.gasLabel.text = gas
 self.met1Label.text = mini
 self.met2Label.text = mfin
 
 
 self.tiem1Label.text = hini
 self.tiem2Label.text = hfin
 
 
 */
