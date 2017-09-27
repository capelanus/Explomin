//
//  ViewController.swift
//  Explomin
//
//  Created by Daniel López on 18/08/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

/*
import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase




var xum = String()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    var arrayProyectos = [String]()
    var arrayPro2 = [ProyectoAdmin]()
    var emilio = String()

    
    @IBAction func logoutButton(_ sender: Any) {
        
      try!  Auth.auth().signOut()
        
      self.performSegue(withIdentifier: "perfounwind", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayProyectos = []
        
        emilio = (UserDefaults.standard.object(forKey: "email") as? String)!
        fetchPro()
        
        
      /*  ref.child("explomin").child("ProyectoAdmin").child().observe(.value, with: { (snapshot) in
            
            print(snapshot)
        })*/
        
        
        
       /* DatabaseService.shared.proadminref.observe(DataEventType.value, with: { (snapshot) in
            
            //print(snapshot)
            
        })*/
        
       // fetchProject()
        
    }
    
    func fetchPro(){
    
    
        ref = Database.database().reference()
        
        
        ref.child("explomin").child("Perforista").queryOrdered(byChild: "email").queryEqual(toValue: emilio ).observe(.value, with: { (snapshot) in
            
            //print (snapshot)
            
            
            self.arrayProyectos = []
            
            
            for rest in snapshot.children.allObjects as! [DataSnapshot]{
                
                let rex  = rest.childSnapshot(forPath: "proyecto").value as! String
                
                self.arrayProyectos.append(rex)
                
                
                
            }
            
           // print("dentro",self.arrayProyectos)
            
            let uno : String = self.arrayProyectos[0]
            
            print(uno)
            

            
            ref = Database.database().reference()
            
            
            ref.child("explomin").child("ProyectoAdmin").child(uno).observe(.value, with: { (snapshot) in
                
                
                if snapshot.value is NSNull {
                    
                print("ta vacio weon")
                
                
                }else{
                    
                    
                    for rest in snapshot.children.allObjects as! [DataSnapshot]{
                        
                        let cliente1 = rest.childSnapshot(forPath: "cliente").value as! String
                        let nombre1 = rest.childSnapshot(forPath: "nombre").value as! String
                        let uni1 = rest.childSnapshot(forPath: "unidadNegocio").value as! String
                        let fecha1 = rest.childSnapshot(forPath: "fecha").value as! String
                        let id1 = rest.childSnapshot(forPath: "id").value as! String
                        
                        let act1 = rest.childSnapshot(forPath: "actividades").value as! [String : AnyObject]
                        let equ1 = rest.childSnapshot(forPath: "equipos").value as! [String : AnyObject]
                        
                   //     let user = ProyectoAdmin(actividades: act1, cliente: cliente1, equipos: equ1, fecha: fecha1, unidadNegocio: uni1, id: id1, nombre: nombre1)
                      //  self.arrayPro2.append(user)
                        
                    }

                    
                    
                    
                
                      /* let cliente = snapshot.childSnapshot(forPath: "cliente")
                       let nombre = snapshot.childSnapshot(forPath: "nombre")
                       let unidad = snapshot.childSnapshot(forPath: "unidadNegocio")
                       let fecha = snapshot.childSnapshot(forPath: "fecha")
                       let id = snapshot.childSnapshot(forPath: "id")
                    
                    let act = snapshot.childSnapshot(forPath: "actividades")
                    let equ = snapshot.childSnapshot(forPath: "equipos")


                    print(cliente, nombre, unidad, fecha, id, act, equ)*/
                    
               //     let pers = ProyectoAdmin(actividades: act, cliente: cliente, equipos: equ, fecha: fecha, unidadNegocio: unidad, id: id, nombre: nombre)
                    
             //       print("sssss",pers)

 
                    
                    
                }
                
           })
            
            
        })
        
       // print(arrayProyectos)

    
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    print("se selecciono", indexPath.row)
        
    
    
    }
    
    func fetchProject(){
    
    
    
    
    
    }
    
   
 
}

*/
