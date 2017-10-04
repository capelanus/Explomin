//
//  ListaEquipoViewController.swift
//  Explomin
//
//  Created by Daniel López on 18/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase



var array1 = [String]()
var arrayp = [String]()
var array3 = [String]()


class ListaEquipoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        array1 = []
        
        array3 = ["uno", "dos", "tres"]
        
        Variables.maqui2 = []
        
        fetchMachines()
        setupNavigationBar()
        

    }
    
    private func setupNavigationBar(){
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "explo"))
        titleImageView.frame = CGRect(x:-57, y:0, width: 86, height: 30)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
    }

    func fetchMachines(){
    
    
     ref = Database.database().reference()
        ref.child("explomin").child("Equipos").queryOrdered(byChild: "nombre").observe(.value, with:{ (snapshot) in
            
            print(snapshot)
            
            arrayp = []

            for rest in snapshot.children.allObjects as! [DataSnapshot]{
            
                let nom = rest.childSnapshot(forPath: "nombre").value! as! String
                //print(nom)
               arrayp.append(nom)
            
            }
            
            DispatchQueue.main.async{
                
               self.myTable.reloadData()
                
            }

            
        })
        
    }
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayp.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if   tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
            
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
            
            let name = arrayp[indexPath.row]
            array1 = array1.filter{$0 != name}
            
            print(array1)
            
            
        }
            
        else{
            
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
            
            let name = arrayp[indexPath.row]
            array1.append(name)
            
            print(array1)
            
        }
        

    
    
    
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListaEquipoCell
        
        cell.nameLabel.text = arrayp[indexPath.row]
        return cell
        
    }
    
 
    
    @IBAction func sendListaMaquina(_ sender: Any) {
        
        Variables.maqui2 = array1
        dismiss(animated: true, completion: nil)
        
    }
    
    
}
