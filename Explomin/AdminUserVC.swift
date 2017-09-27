//
//  AdminUserVC.swift
//  Explomin
//
//  Created by Daniel López on 20/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import Firebase




class AdminUserVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    
    
    var arrayUsuarios = [Usuario]()
    @IBOutlet weak var myTableView: UITableView!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayUsuarios = []

        fetchUser()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchUser(){
    
        ref = Database.database().reference()
        ref.child("explomin").child("Usuarios").observe(.value, with: { (snapshot) in
            

            self.arrayUsuarios = []

            
            for rest in snapshot.children.allObjects as! [DataSnapshot]{
            
                let email1 = rest.childSnapshot(forPath: "email").value as! String
                let empresa1 = rest.childSnapshot(forPath: "empresa").value as! String
                let key1 = rest.childSnapshot(forPath: "key").value as! String
                let nombre1 = rest.childSnapshot(forPath: "nombre").value as! String
                let tipo1 = rest.childSnapshot(forPath: "tipo").value as! String
                
                let user = Usuario(nombre: nombre1, email: email1, key: key1, tipo: tipo1, empresa: empresa1)
                
                self.arrayUsuarios.append(user)
                
            }
            
           DispatchQueue.main.async{
                self.myTableView.reloadData()
            }
            
        })

        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("seleccionado", indexPath.row)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("numberofrowsinsection=", arrayUsuarios.count)
        return arrayUsuarios.count
    
    }
    
   /* func numberOfSections(in myTableView: UITableView) -> Int {
        
        return 1
        
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UsuarioCell
        
        let user : Usuario
        user = arrayUsuarios[indexPath.row]
        
        cell.emailLabel.text = user.email
        cell.empresaLabel.text = user.empresa
        cell.nombreLabel.text = user.nombre
        cell.cargoLabel.text = user.tipo
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle : UITableViewCellEditingStyle, forRowAt indexPath : IndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            let user : Usuario
            user = arrayUsuarios[indexPath.row]
            
            let keyx = user.key
            let tipox = user.tipo

            arrayUsuarios.remove(at: indexPath.row)
            
            myTableView.reloadData()
            
        
            Database.database().reference().child("explomin").child("Usuarios").child(keyx).removeValue(completionBlock: { (error, DatabaseReference) in
                
            if error != nil {
                    print(error!)
                }
                
            })
            
            if tipox == "perforista"{
                
                Database.database().reference().child("explomin").child("Perforista").child(keyx).removeValue(completionBlock: { (error, DatabaseReference) in
                    
                    if error != nil {
                        print(error!)
                    }
                    
                })
            
            }
            if tipox == "cliente"{
                
                Database.database().reference().child("explomin").child("Cliente").child(keyx).removeValue(completionBlock: { (error, DatabaseReference) in
                    
                    if error != nil {
                        print(error!)
                    }
                    
                })
            
            
            }
            if tipox == "supervisor"{
                
                Database.database().reference().child("explomin").child("Supervisores").child(keyx).removeValue(completionBlock: { (error, DatabaseReference) in
                    
                    if error != nil {
                        print(error!)
                    }
                    
                })
            
            }
            if tipox == "administrador"{
                
                Database.database().reference().child("explomin").child("Administradores").child(keyx).removeValue(completionBlock: { (error, DatabaseReference) in
                    
                    if error != nil {
                        print(error!)
                    }
                    
                })
            
            }

            
            
        }
    }
    
    
    
    
    
    @IBAction func exit(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func show(_ sender: Any) {
        
        print("este es el array despues", self.arrayUsuarios)
    }


}
