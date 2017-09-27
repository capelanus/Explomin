//
//  ListaPerforistasViewController.swift
//  
//
//  Created by Daniel López on 18/09/17.
//
//

import UIKit
import Firebase

var perforistas = [Perforista]()
var perforistasPass = [Perforista]()



class ListaPerforistasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var arrayFInal = [String]()
    var arrayInicial = [String]()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        arrayInicial = []
        fetchPerforista()
        
        

        
        
    
    }
    
    func fetchPerforista(){
    
   
        
        ref = Database.database().reference()
        ref.child("explomin").child("Perforista").queryOrdered(byChild: "nombre").observe(.value, with: { (snapshot) in
            
            self.arrayFInal = []
            perforistas = []
            
            for rest in snapshot.children.allObjects as! [DataSnapshot] {
                
                let firmac = rest.childSnapshot(forPath: "nombre").value! as! String
                let libre = rest.childSnapshot(forPath: "proyecto").value! as! String
                let keyx = rest.childSnapshot(forPath: "key").value! as! String
                let mail = rest.childSnapshot(forPath: "email").value! as! String

                let perf = Perforista(email : mail, nombre: firmac, key : keyx,proyecto:libre)
                
                if libre == "libre"{
                    
                    
                    perforistas.append(perf)
                    //self.arrayFInal.append(firmac)
                    
                    
                }
                
                
                
            }
            
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
            
            
        })
        
        
    
    }

    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return perforistas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PerforistaCell
        
        let perfo : Perforista
        
        perfo = perforistas[indexPath.row]
        
        
        cell.nameLabel.text = perfo.nombre
        
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
            return 1
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    
      
        if   tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
        
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
            
            let perfo : Perforista
            
            perfo = perforistas[indexPath.row]
            
            let xxx = perfo.key
            
            let index = perforistasPass.index{$0.key == xxx} //me devuelve el index de perfo
            
            perforistasPass.remove(at: index!)
            
            print(perforistasPass)
            
            }
            
         
        
        else{
        
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
    
    let perfo : Perforista
    
    perfo = perforistas[indexPath.row]
    
    perforistasPass.append(perfo)
            
            print(perforistasPass)
    
    
        
        }
        
        

        
        
    
    }
    
    @IBAction func sendPerf(_ sender: Any) {
        
        Variables.perfo2 = perforistasPass
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    }






















