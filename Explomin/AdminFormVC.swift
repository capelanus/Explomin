//
//  AdminFormVC.swift
//  Explomin
//
//  Created by Daniel López on 20/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class AdminFormVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()

        // Do any additional setup after loading the view.
    }

    private func setupNavigationBar(){
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "explo"))
        titleImageView.frame = CGRect(x:-57, y:0, width: 86, height: 30)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
    }

}
