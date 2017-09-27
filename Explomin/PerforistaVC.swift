//
//  PerforistaVC.swift
//  Explomin
//
//  Created by Daniel López on 21/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import Firebase


class PerforistaVC: UIViewController {
    
    
    var nos = [Perforista]()
    var email = String()
    

    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        nos = []
        email = UserDefaults.standard.value(forKey: "email") as! String
        fetchProject()


    }
    
    
    func fetchProject(){
    
        ref = Database.database().reference()
        ref.child("explomin").child("Perforista").observe(.value, with: { (snapshot) in
            
            //print(snapshot)
            
            for rest in snapshot.children.allObjects as! [DataSnapshot]{
                
                let email1 = rest.childSnapshot(forPath: "email").value as! String
                let key1 = rest.childSnapshot(forPath: "key").value as! String
                let nombre1 = rest.childSnapshot(forPath: "nombre").value as! String
                let proyecto1 = rest.childSnapshot(forPath: "proyecto").value as! String
                
                let userq = Perforista(email: email1, nombre: nombre1, key: key1, proyecto: proyecto1)
                
                if email1 == self.email {
                
                self.nos.append(userq)
                
                }
                
            }
        
            print(self.nos)
            self.setData()

    
        }
    
    
    )}
    
    func setData(){
    

        let yop = nos[0]
        
        self.nombreLabel.text = yop.nombre
        self.emailLabel.text = yop.email
        Variables.key = yop.proyecto
    
    }

 

    @IBAction func logout(_ sender: Any) {
        
        self.performSegue(withIdentifier: "logout", sender: self)
        try!  Auth.auth().signOut()
    }

}
