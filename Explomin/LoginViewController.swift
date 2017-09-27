//
//  LoginViewController.swift
//  Explomin
//
//  Created by Daniel López on 22/08/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

struct postStruct {
    
    let title : String!
    let message : String!
    
}


class LoginViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    var ref: DatabaseReference!
    var refHandle : UInt!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.userTextField.delegate=self
        self.passwordTextField.delegate=self
        
    }

    
    
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        

        
        if userTextField.text != "" && passwordTextField.text != "" {
            
        
            Auth.auth().signIn(withEmail: userTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                
                if user != nil{
                    
                    print("Acceso OK...")
                    
                    //Verificar tipo de usuario
                   
                    
                    
                    Database.database().reference().child("explomin").child("Perforista").queryOrdered(byChild: "email").queryEqual(toValue: self.userTextField.text).observe(.value, with: { (snapshot) in
                        
                        if snapshot.exists(){
                            
                            print("si es perforista")
                            
                            
                            ///////////////guardar email en user defaults//////////////
                       
                            UserDefaults.standard.set(self.userTextField.text, forKey: "email")
                            ///////////////guardar email en user defaults//////////////
                            
                            //email = UserDefaults.standard.value(forKey: "email") as! String

                            // Para leer...
                            

                            
                            self.userTextField.text = ""
                            self.passwordTextField.text = ""
                        
                            self.performSegue(withIdentifier: "segue1", sender: self)

                            
                        }
                        
                        else{
                        
                            //Hacer el logout aqui
                            print("entra pero no es perforista")
                            do {
                                try Auth.auth().signOut()
                            } catch (let error) {
                                print((error as NSError).code)
                            }
                            
                        }
                        
                        
                    }, withCancel: nil)
                    
                    
                    
                    
                    
                    
                }
                    
              else{
                    
                    if let myError = error?.localizedDescription{
                    
                    print(myError)
                        
                    }
                    
                    else
                    {
                        
                    print("ERROR")
                        
                    }
                
                }
                

            })
            
        }
    }
    
    
    
  
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
 
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return (true)
        
    }
    
    
    
   
    
    @IBAction func exit(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    //se supone que esto busca los usuarios
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
