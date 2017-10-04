//
//  MuestrasViewController.swift
//  Explomin
//
//  Created by Daniel López on 16/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit


class MuestrasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var corridas = [[:]]

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var desdeTextField: UITextField!
    @IBOutlet weak var hastaTextField: UITextField!
    @IBOutlet weak var longTextFIeld: UITextField!
    @IBOutlet weak var ok: UIButton!
    
    var desde = 0
    var hasta = 0
    var porcentajes = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        corridas = []
        porcentajes = []

        
        desdeTextField.addTarget(self, action: #selector(textOnTextFieldDidChange(textField:)), for: .editingChanged)
        hastaTextField.addTarget(self, action: #selector(textOnTextFieldDidChange(textField:)), for: .editingChanged)
        
        ok.layer.cornerRadius = 10
        ok.clipsToBounds = true
    
    }
    
  
    

        
    
    
    func textOnTextFieldDidChange(textField: UITextField){
    
        if textField === desdeTextField {
            desde = Int(textField.text!) ?? 0
        } else if textField === hastaTextField {
            hasta = Int(textField.text!) ?? 0
        }
        
       // let vat = String(desde + hasta)
    
    }
    
    
    @IBAction func addRow(_ sender: Any) {
        
        let from = desdeTextField.text
        let to = hastaTextField.text
        let lon = longTextFIeld.text
        
        let lon2 = lon! + String(" metros")!
        
        let desde  = Int(desdeTextField.text!) ?? 0
        let hasta  = Int(hastaTextField.text!) ?? 0
        let longitud  = Int(longTextFIeld.text!) ?? 0

        
        let total = (longitud * 100)/(hasta - desde)
        let total2 = String(total) + String(" %")
        
        self.porcentajes.append(total2)

        
        
        let corri : [String:AnyObject] = ["desde": from as AnyObject, "hasta": to as AnyObject, "longitud": lon2 as AnyObject]

        corridas.append(corri)
        
        desdeTextField.text = to
        hastaTextField.text = ""
        longTextFIeld.text = ""
        
        print(corridas)
        tableview.reloadData()
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return corridas.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celu", for: indexPath)as! CorridaCell
        
        let duo : [String : AnyObject] = corridas[indexPath.row] as! [String : AnyObject]
        
        cell.oneLabel.text = duo["desde"] as? String
        cell.twoLabel.text = duo["hasta"] as? String
        cell.threeLabel.text = duo["longitud"] as? String
        
        cell.totalLabel.text = porcentajes[indexPath.row]

        
        
        
        return cell
    }

   
    @IBAction func send(_ sender: Any) {
        
        
        Variables.corrx2 = corridas
        dismiss(animated: true, completion: nil)
    }

}
