//
//  LoginClienteViewController.swift
//  Explomin
//
//  Created by Daniel López on 13/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginClienteViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
  
    @IBOutlet weak var enter: UIButton!
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
        self.passwordTextField.delegate = self
        self.emailTextField.delegate = self
        
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        
        
        enter.layer.borderWidth = 1.5
        enter.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        enter.layer.cornerRadius = cornerRadius

        
    }

  
    @IBAction func go(_ sender: Any) {
        
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                
                if user != nil{
                    
                    print("Acceso OK...")
                    
                    //Verificar tipo de usuario
                    
                    
                    
                    Database.database().reference().child("explomin").child("Cliente").queryOrdered(byChild: "email").queryEqual(toValue: self.emailTextField.text).observe(.value, with: { (snapshot) in
                        
                        if snapshot.exists(){
                            
                            print("si es cliente")
                            
                            UserDefaults.standard.set(self.emailTextField.text, forKey: "email")
                            
                            
                            
                            self.emailTextField.text = ""
                            self.passwordTextField.text = ""
                            
                            self.performSegue(withIdentifier: "segue4", sender: self)

                            
                        }
                            
                        else{
                            
                            //Hacer el logout aqui
                            print("existe pero no es cliente")
                            
                            do {
                                try Auth.auth().signOut()
                            } catch (let error) {
                                print((error as NSError).code)
                            }
                            
                        }
                        
                        
                    }, withCancel: nil)
                    
                    
                    
                    
                    
                    
                }
                    
                else        {
                    
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
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return (true)
        
    }
    
    
    
    
    
    
    
    
    
    @IBAction func exit(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
