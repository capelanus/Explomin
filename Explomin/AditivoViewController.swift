//
//  AditivoViewController.swift
//  Explomin
//
//  Created by Daniel López on 16/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit


class AditivoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var uniTextField: UITextField!
    @IBOutlet weak var canTextField: UITextField!
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var ok: UIButton!
    
    var aditivos = ["Bento Plug", "Max Gel", "Sulfato de aluminio", "Poly Seal", "PTC Pac HV", "Corewell", "Poly plus liquido"]
    var unis = ["Unidades", "Cajas", "Sacos", "unidades", "Baldes"]
    var picker = UIPickerView()
    var picker2 = UIPickerView()

    var array = [[ : ]]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ok.layer.cornerRadius = 10
        ok.clipsToBounds = true
        
        picker.delegate = self
        picker.dataSource = self
        
        picker2.delegate = self
        picker2.dataSource = self
        
        array = []
        
        textField.inputView = picker2

        uniTextField.inputView = picker

        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        if pickerView == picker2{
            
            return aditivos[row]
            
        }
        
        return unis[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == picker2{
            
            return aditivos.count
            
        }
        
        return unis.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == picker2{
            
            textField.text = aditivos[row]
            self.view.endEditing(false)

            
        }
        
        
        uniTextField.text = unis[row]
        self.view.endEditing(false)
        
    }
    
    
    
    
    
    //TABLA
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AditivoCell
        
        let red = array[indexPath.row]
        
        cell.nombreLabel.text = red["nombre"] as? String
        cell.cantidadLabel.text = red["cantidad"] as? String
        cell.unidad.text = red["unidades"] as? String

        
        
        return cell
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
 
   //BOTON AGREGAR +
    

    @IBAction func additive(_ sender: Any) {
        
        let adi = textField.text
        let uni = uniTextField.text
        let can = canTextField.text
        
        
        let dic : [String : AnyObject] = ["nombre" : adi as AnyObject, "cantidad": uni as AnyObject, "unidades":can as AnyObject]
        
        
        array.append(dic)
        
        
        textField.text = ""
        uniTextField.text = ""
        canTextField.text = ""
        
        myTable.reloadData()
        
        
        
    }
    
  
    
    
    @IBAction func fin(_ sender: Any) {
        
       /* if let presenter = AditivoViewController as? FormularioViewController {
            //presenter.contacts.append(newContact)
            
            print("")
            
            
        }*/
        
        print(array)
        
        Variables.adix2 = array
            dismiss(animated:true, completion: nil )
        
        
        
    }
    
}
