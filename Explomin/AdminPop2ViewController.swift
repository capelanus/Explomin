//
//  AdminPop2ViewController.swift
//  Explomin
//
//  Created by Daniel López on 12/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import FirebaseDatabase

var groupNames = [String]()
var groupNames2 = [AnyObject]()
var groupNames3 = [String]()

var selectedIndexPathArray = Array<NSIndexPath>()
var name : String!


class AdminPop2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    @IBOutlet weak var table: UITableView!
    
    struct Objects{
    
        var sectionName : String!
        var sectionObjects : [String]!
        
    }
    
    var obejectsArray = [Objects]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupNavigationBar()
        
        Variables.acti2 = []
        
        groupNames3 = []

        obejectsArray = [Objects(sectionName:"Horas de perforación", sectionObjects:["perforación convencional","Perforación con devidrill"]),
                         Objects(sectionName:"Horas de seguridad no programadas", sectionObjects:["Accidente","Auditoría","Orden y limpieza","Incidente de seguridad"]),
                         Objects(sectionName:"Horas de seguridad programadas", sectionObjects:["Auditoría planificada","Cambio de guardia","Charlas de seguridad","Inducción de seguridad","Llenado de herramientas de gestión (IPERC)"]),
                         Objects(sectionName:"Horas muertas no programadas", sectionObjects:["Falta de materiales y/o herramientas","Falta de mecánico","Falta de movilidad","Falta de personal","Falta de repuestos y/o consumibles"])]
        
            fetchActividad()
            fetchSubActividad()
        
    
    
    }
    
 
    
    private func setupNavigationBar(){
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "explo"))
        titleImageView.frame = CGRect(x:-57, y:0, width: 86, height: 30)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        
        return obejectsArray.count
        
    }
    
    
    

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return obejectsArray[section].sectionObjects.count
}
    
    
    

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! My2TableViewCell
    
    cell.labelName.text = obejectsArray[indexPath.section].sectionObjects[indexPath.row]
    
  
    
    return cell
    
}



func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
    
    tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        
        
        name =  obejectsArray[indexPath.section].sectionObjects[indexPath.row]

        groupNames3 = groupNames3.filter{$0 != name}
        
        print(groupNames3)
        
        
    }else{
    
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        name =  obejectsArray[indexPath.section].sectionObjects[indexPath.row]
        
                groupNames3.append(name as String)
            
        print(groupNames3)

        
        

    }
    
   
    
    
  //  print("se ha seleccionado", indexPath.row)
    selectedIndexPathArray.append(indexPath as NSIndexPath)
    tableView.reloadData()
}
    
    

    
    
func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return obejectsArray[section].sectionName
}



func fetchActividad(){
    
    
    ref = Database.database().reference()
    ref.child("explomin").child("Actividades2").queryOrderedByValue().observe(
        .value, with: { (snapshot) in
            
            
            for group in snapshot.children {
                groupNames.append((group as AnyObject).key)
            }
            
            
    })
    
    
}

func fetchSubActividad(){



    
    ref = Database.database().reference()
    ref.child("explomin").child("Actividades2").queryOrderedByValue().observe(
        .value, with: { (snapshot) in
            
            
            for group in snapshot.children {
                groupNames2.append((group as AnyObject))
            }
            
           // print(groupNames2)
            
    })
    
    
}

    @IBAction func sendHoras(_ sender: Any) {
        
        Variables.acti2 = groupNames3
        dismiss(animated: true, completion: nil)
        
        
    }

}


