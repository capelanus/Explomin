//
//  ClienteViewController.swift
//  Explomin
//
//  Created by Daniel López on 20/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ClienteViewController: UIViewController {
    
    var email = String()
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var empresaLabel: UILabel!
    @IBOutlet weak var nombreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    setupNavigationBar()
        
    
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        email = UserDefaults.standard.value(forKey: "email") as! String
        
        fetchData()
        
    }
    
    private func setupNavigationBar(){
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "explo"))
        titleImageView.frame = CGRect(x:-57, y:0, width: 86, height: 30)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
    }
    
    func fetchData(){
    
        Database.database().reference().child("explomin").child("Cliente").queryOrdered(byChild: "email").queryEqual(toValue: email).observe(.value, with: { (snapshot) in
        
        
            for rest in snapshot.children.allObjects as! [DataSnapshot]{
            
            
                self.nombreLabel.text = rest.childSnapshot(forPath: "nombre").value as? String
                self.empresaLabel.text = rest.childSnapshot(forPath: "empresa").value as? String
                self.emailLabel.text = rest.childSnapshot(forPath: "email").value as? String
                    Variables.empresaCli = (rest.childSnapshot(forPath: "empresa").value as? String)!

                
                //let dic : [String : AnyObject] = ["nombre":nombre as AnyObject,"empresa":empresa as AnyObject, "email":email as AnyObject]
                
            }
            
        })
    
    
    }

 
    @IBAction func logOut(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "logout4", sender: self)
        try!  Auth.auth().signOut()

        
    }

    @IBAction func Proyectos(_ sender: Any) {
        
        self.performSegue(withIdentifier: "go", sender: self)
    }
}
