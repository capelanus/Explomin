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
        
        setupNavigationBar()
        
        
    }
    
    private func setupNavigationBar(){
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "explo"))
        titleImageView.frame = CGRect(x:-57, y:0, width: 86, height: 30)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
    }

    @IBAction func logOut(_ sender: Any) {
        
        self.performSegue(withIdentifier: "logout3", sender: self)
        try!  Auth.auth().signOut()
        
    }

    
    
    
}
