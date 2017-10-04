//
//  Admin2ViewController.swift
//  Explomin
//
//  Created by Daniel López on 5/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

struct postStruct2{

    let email : String!
    let name : String!
    let type : String!

}



class Admin2ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var empresatextField: UITextField!
    
    var picker = UIPickerView()
    var posts2 = [postStruct2]()
    var tipo1 : String = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        self.empresatextField.delegate = self
        self.nameTextfield.delegate = self
        self.passwordTextField.delegate = self
        self.empresatextField.delegate = self
        
        
        picker.delegate = self
        picker.dataSource = self
        
        userTextField.inputView = picker
        
        
        // Do any additional setup after loading the view.
    }
    
    private func setupNavigationBar(){
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "explo"))
        titleImageView.frame = CGRect(x:-57, y:0, width: 86, height: 30)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
    }

    
    
    @IBAction func createButton(_ sender: Any) {
        
        let email1 = emailTextField.text
        let name1 = nameTextfield.text
        let password1 = passwordTextField.text
        let empresa = empresatextField.text
        let type = tipo1

        emailTextField.text = ""
        nameTextfield.text = ""
        passwordTextField.text = ""
        userTextField.text = ""
        empresatextField.text = ""
        
        
        Auth.auth().createUser(withEmail: email1!, password: password1!) { (FIRUser, error) in
            
            if error == nil{
            
            print("se ha creado el usuario")
                
        if self.tipo1 == "Perforista"{
                
                    print("entra")
                    
                    
                    
            let databaseRef = Database.database().reference().child("explomin").child("Perforista").childByAutoId()
                    
            let key = databaseRef.key

            

                databaseRef.setValue(["nombre": name1,"empresa":empresa, "email": email1, "key": key, "proyecto": "libre"])
            
            let usuario : [String : AnyObject] = ["nombre": name1 as AnyObject, "email": email1 as AnyObject, "key": key as AnyObject, "empresa": empresa as AnyObject, "tipo": type as AnyObject]
            
            Database.database().reference().child("explomin").child("Usuarios").child(key).setValue(usuario)
            
            
        }
                
        if self.tipo1 == "Supervisor"{
                    
                    print("entra")
                    
                    
                    
                    let databaseRef = Database.database().reference().child("explomin").child("Supervisores").childByAutoId()
                    
                    let key = databaseRef.key

            
                    
                    databaseRef.setValue(["nombre": name1,"empresa":empresa, "email": email1, "key": key])
            
            let usuario : [String : AnyObject] = ["nombre": name1 as AnyObject, "email": email1 as AnyObject, "key": key as AnyObject, "empresa": empresa as AnyObject, "tipo": type as AnyObject]
            
            Database.database().reference().child("explomin").child("Usuarios").child(key).setValue(usuario)
            
            
                    
                    
                }
                
        if self.tipo1 == "Administrador"{
                    
                    print("entra")
                    
                    
                    
                    let databaseRef = Database.database().reference().child("explomin").child("Administradores").childByAutoId()
                    
                    let key = databaseRef.key

            
                    
                    databaseRef.setValue(["nombre": name1,"empresa":empresa, "email": email1, "key": key])
            
            let usuario : [String : AnyObject] = ["nombre": name1 as AnyObject, "email": email1 as AnyObject, "key": key as AnyObject, "empresa": empresa as AnyObject, "tipo": type as AnyObject]
            
            Database.database().reference().child("explomin").child("Usuarios").child(key).setValue(usuario)
            
                    
                }
                
                if self.tipo1 == "Cliente"{
                    
                    print("entra")
                    
                    
                    
                    let databaseRef = Database.database().reference().child("explomin").child("Cliente").childByAutoId()
                    
                    let key = databaseRef.key
                    
                    
                    databaseRef.setValue(["nombre": name1,"empresa":empresa, "email": email1, "key": key])
                    
                    let usuario : [String : AnyObject] = ["nombre": name1 as AnyObject, "email": email1 as AnyObject, "key": key as AnyObject, "empresa": empresa as AnyObject, "tipo": type as AnyObject]
                    
                    Database.database().reference().child("explomin").child("Usuarios").child(key).setValue(usuario)
                    
                    
                }
                
                
                
               /* let databaseRef = Database.database().reference().child("explomin").child("Usuarios").childByAutoId()
                
                let key = databaseRef.key
                
                
                databaseRef.setValue(["nombre": name1, "email": email1,"tipo":type, "key": key])*/

                
            }
            
            else{
            
            print("ta cagao el usuario")
                print(error!)
                
            }
            
            
            
        }
        
        
        
        
        
        
        
        
        
       /* let post : [String : AnyObject] = [email : email1 as AnyObject, name : name as AnyObject]
        
        let databaseRef = Database.database().reference()
        databaseRef.child("Usuarios").childByAutoId().setValue(post)*/
        
        
    }
    
    let tipos = ["Perforista", "Administrador", "Supervisor", "Cliente"]
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return tipos[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return tipos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
         tipo1 = tipos[row]
         userTextField.text = tipos[row]
        self.view.endEditing(false)
    
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
