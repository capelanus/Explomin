//
//  AdminMachVC.swift
//  Explomin
//
//  Created by Daniel López on 20/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import Firebase




class AdminMachVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTable: UITableView!
    var arrayMaquinas = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayMaquinas = []
        
        fetchMachines()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMaquinas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MaquinaCell
        
            let nom = arrayMaquinas[indexPath.row]
            cell.nombreLabel.text = nom
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func fetchMachines(){
    
        ref = Database.database().reference()
        ref.child("explomin").child("Equipos").observe(.value, with: { (snapshot) in
            
            self.arrayMaquinas = []

            
            for rest in snapshot.children.allObjects as! [DataSnapshot]{
            
            let nom = rest.childSnapshot(forPath: "nombre").value as! String
                
                self.arrayMaquinas.append(nom)

            
            }
            
            self.myTable.reloadData()
            
        }
    
    
    )}
   
    @IBAction func exit(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }

}
