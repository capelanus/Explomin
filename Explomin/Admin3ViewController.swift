//
//  Admin3ViewController.swift
//  Explomin
//
//  Created by Daniel López on 6/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

struct postProyect{

    
    let cliente : String!
    let nompy : String!
    let unineg : String!
    let date : String!
    let actividades = [String!]()
    let equipos = [String!]()
    

}


var ref: DatabaseReference!
var arrayMin = [String]()
var arrayPro = [String]()
var arrayBus = [String]()

var datoCli : String!
var datoPro : String!
var datoUne : String!




class Admin3ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    
    @IBOutlet weak var clienteTextField: UITextField!
    @IBOutlet weak var proyectoTextField: UITextField!
    @IBOutlet weak var unegocioTextField: UITextField!
    @IBOutlet weak var pkdate: UIDatePicker!
    
    var picker = UIPickerView()
    var picker2 = UIPickerView()
    var picker3 = UIPickerView()


    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchClient()
        fetchProject()
        fecthNegocio()
        
        picker.delegate = self
        picker.dataSource = self
        
        picker2.delegate = self
        picker2.dataSource = self
        
        picker3.delegate = self
        picker3.dataSource = self
        
        clienteTextField.inputView = picker
        
        proyectoTextField.inputView = picker2
        
        unegocioTextField.inputView = picker3
        
      

        
    }
    
    
    
    
    
    
    
    @IBAction func selectButton(_ sender: Any) {
    }
    

    @IBAction func createButton(_ sender: Any) {
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        let date = formatter.string(from: pkdate.date)
        
       // let perf = Variables.perfo2
        let maq = Variables.maqui2
        let act = Variables.acti2
        
        
        
        
        
        
        let databaseRef = Database.database().reference().child("explomin").child("ProyectoAdmin").childByAutoId()
        
        let ref2 = databaseRef.key
        
        print (ref2)
        
        let ref3 = ref2.makeFirebaseString()
        
        print(ref3)
        
        let post : [String : AnyObject] = ["cliente" : datoCli as AnyObject, "id" : "0" as AnyObject, "unidadNegocio" : datoUne as AnyObject, "nombre" : datoPro as AnyObject, "fecha" : date as AnyObject, "equipos": maq as AnyObject, "actividades" : act as AnyObject, "key": ref3 as AnyObject]
        
        Database.database().reference().child("explomin").child("ProyectoAdmin").child(ref3).setValue(post)
        
        // ref2 es la key del proyecto que estoy creando, debo asignarla a los perforistas elegidos
        
        var arrayperforistas = [Perforista]()
        
        
        arrayperforistas = Variables.perfo2
    
        for user in arrayperforistas {
        
            
            let key1 : String = user.key
            
            let nom = user.nombre
            let mail1 = user.email
        
            
            let post1 : [String : AnyObject] = ["email": mail1 as AnyObject, "key": key1 as String as AnyObject, "nombre": nom as AnyObject, "proyecto":ref3 as AnyObject]
            
            Database.database().reference().child("explomin").child("Perforista").child(key1).setValue(post1)
        
            
        }
        
        Variables.perfo2 = []
        Variables.maqui2 = []
        Variables.acti2 = []
        
        self.clienteTextField.text = ""
        self.proyectoTextField.text = ""
        self.unegocioTextField.text = ""
        
        
    }
    
    func fetchProject(){
    
    
        ref = Database.database().reference()
        ref.child("explomin").child("Proyectos").queryOrdered(byChild: "nombre").observe(.value, with: { (snapshot) in
            
            
            for rest in snapshot.children.allObjects as! [DataSnapshot] {
                
                let firpro = rest.childSnapshot(forPath: "nombre").value! as! String
                
                
                arrayPro.append(firpro)
                
            }
            
            print(arrayPro)
            
        })

    
    }
    
    func fetchClient(){
    
    
        ref = Database.database().reference()
        ref.child("explomin").child("Clientes").queryOrdered(byChild: "nombre").observe(.value, with: { (snapshot) in
            
            
            for rest in snapshot.children.allObjects as! [DataSnapshot] {
                
                let firUserId = rest.childSnapshot(forPath: "nombre").value! as! String
                
                arrayMin.append(firUserId)
                
            }
            
            
        })
    
    }
    
    func fecthNegocio(){
        
  
    
        
        
        
        
        ref = Database.database().reference()
        ref.child("explomin").child("UnidadNegocio").queryOrdered(byChild: "nombre").observe(.value, with: { (snapshot) in
            
            
            for rest in snapshot.children.allObjects as! [DataSnapshot] {
                
                let firUserId = rest.childSnapshot(forPath: "nombre").value! as! String
                
                arrayBus.append(firUserId)
                
            }
            
            
            
        })

    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == picker{
        
            return arrayMin.count

        }
        
        if pickerView == picker2{
            
            return arrayPro.count
            
        }
        
        if pickerView == picker3{
            
            return arrayBus.count
            
        }
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == picker{
            
            return arrayMin[row]
            
        }
        
        if pickerView == picker2{
            
            return arrayPro[row]
            
        }
        
        if pickerView == picker3{
            
            return arrayBus[row]
            
        }
        
       return ("cero")
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == picker{
           
            datoCli=arrayMin[row]
            clienteTextField.text = arrayMin[row]
            self.view.endEditing(false)
            
        }
        
        if pickerView == picker2{
            
            datoPro=arrayPro[row]
            proyectoTextField.text = arrayPro[row]
            self.view.endEditing(false)
            
        }
        
        if pickerView == picker3{
            
            datoUne=arrayBus[row]
            unegocioTextField.text = arrayBus[row]
            self.view.endEditing(false)
            
        }
        
        

    }
   

}

extension String {
    func makeFirebaseString()->String{
        let arrCharacterToReplace = [".","#","$","[","]"]
        var finalString = self
        
        for character in arrCharacterToReplace{
            finalString = finalString.replacingOccurrences(of: character, with: " ")
        }
        
        return finalString
    }
}
