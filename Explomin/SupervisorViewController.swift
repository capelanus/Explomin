//
//  SupervisorViewController.swift
//  Explomin
//
//  Created by Daniel López on 20/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase

class SupervisorViewController: UIViewController {
    
    var email = String()
    var nos = [String:String]()

    @IBOutlet weak var nombreLabel: UILabel!

    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        nos = [:]
        email = UserDefaults.standard.value(forKey: "email") as! String
        fetchSupervisor()
        
    }

    
    @IBAction func logOut(_ sender: Any) {
        
        try!  Auth.auth().signOut()
        self.performSegue(withIdentifier: "logout2", sender: self)
        
    }
    
    func fetchSupervisor(){
    
        ref = Database.database().reference()
        ref.child("explomin").child("Supervisores").observe(.value, with: { (snapshot) in
            
            
            
            for rest in snapshot.children.allObjects as! [DataSnapshot]{
            
                let email1 = rest.childSnapshot(forPath: "email").value as! String
                
                if email1 == self.email {
                
                    let nombre1 = rest.childSnapshot(forPath: "nombre").value as! String
                    
                    self.nos = ["nombre":nombre1, "email":email1]
                    
                
                }
                
                
                
            
            }
            
            self.setData()
            
        }
    
    
    )}
    
    
    func setData(){
    
    self.nombreLabel.text = nos["nombre"]
    self.emailLabel.text = nos["email"]
        
        let nombre = nos["nombre"]
        
        UserDefaults.standard.set(nombre, forKey: "nombre")
    
    
    }

}
