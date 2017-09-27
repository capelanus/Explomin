//
//  AdminViewController.swift
//  Explomin
//
//  Created by Daniel López on 5/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class AdminViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logOut(_ sender: Any) {
        
        self.performSegue(withIdentifier: "logout3", sender: self)
        try!  Auth.auth().signOut()
        
    }

    
    
    
}
