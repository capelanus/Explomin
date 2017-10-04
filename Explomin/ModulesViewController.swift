//
//  ModulesViewController.swift
//  Explomin
//
//  Created by Daniel López on 13/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class ModulesViewController: UIViewController {

   
    @IBOutlet weak var perforista: UIButton!
    @IBOutlet weak var supervisor: UIButton!
    @IBOutlet weak var jefe: UIButton!
    @IBOutlet weak var administrador: UIButton!
    @IBOutlet weak var cliente: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
       
  
        perforista.layer.borderWidth = 1.5
        perforista.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        perforista.layer.cornerRadius = cornerRadius
        
        
        supervisor.layer.borderWidth = 1.5
        supervisor.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        supervisor.layer.cornerRadius = cornerRadius
        

        jefe.layer.borderWidth = 1.5
        jefe.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        jefe.layer.cornerRadius = cornerRadius
        
        
        administrador.layer.borderWidth = 1.5
        administrador.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        administrador.layer.cornerRadius = cornerRadius
        
        
        cliente.layer.borderWidth = 1.5
        cliente.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        cliente.layer.cornerRadius = cornerRadius
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
