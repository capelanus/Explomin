//
//  LoginAdminViewController.swift
//  Explomin
//
//  Created by Daniel López on 13/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginAdminViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var entrar: UIButton!
    @IBAction func goButton(_ sender: Any) {
        
        if mailTextField.text != "" && passwordTextField.text != "" {
            
            
            Auth.auth().signIn(withEmail: mailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                
                if user != nil{
                    
                    print("Acceso OK...")
                    
                    //Verificar tipo de usuario
                    
                    
                    
                    Database.database().reference().child("explomin").child("Administradores").queryOrdered(byChild: "email").queryEqual(toValue: self.mailTextField.text).observe(.value, with: { (snapshot) in
                        
                        if snapshot.exists(){
                            
                            print("si es admin")
                            
                            self.performSegue(withIdentifier: "segue3", sender: self)

                            
                            
                        }
                            
                        else{
                            
                            //Hacer el logout aqui
                            print("existe pero no es admin")
                            
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        
        
        entrar.layer.borderWidth = 1.5
        entrar.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        entrar.layer.cornerRadius = cornerRadius
        


        // Do any additional setup after loading the view.
    }

 

    @IBAction func exit(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
