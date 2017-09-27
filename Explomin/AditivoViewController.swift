//
//  AditivoViewController.swift
//  Explomin
//
//  Created by Daniel López on 16/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

//var aditivos = [Aditivo]()

protocol DataSentDelegate{


    func userDidEnterData(data : AnyObject)

}

class AditivoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var uniTextField: UITextField!
    @IBOutlet weak var canTextField: UITextField!
    @IBOutlet weak var myTable: UITableView!
    
    var unis = ["Unidades", "Cajas", "Sacos", "unidades", "Baldes"]
    var picker = UIPickerView()
    var array = [[String : AnyObject]]()

   // var delegate : DataSentDelegate? = nil
    var dic = [String : AnyObject]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        
        array = [[:]]
        
        uniTextField.inputView = picker

        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return unis[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return unis.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        uniTextField.text = unis[row]
        self.view.endEditing(false)
        
    }
    
    
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
 
   
    

    @IBAction func additive(_ sender: Any) {
        
        let adi = textField.text
        let uni = uniTextField.text
        let can = canTextField.text
        
        
        dic = ["nombre" : adi as AnyObject, "cantidad": uni as AnyObject, "unidades":can as AnyObject]
        
        
        self.array.append(dic)
        //Variables.adix2.append(dic)
        
        
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
        
        Variables.adix2 = array
            dismiss(animated:true, completion: nil )
        
        
        
    }
    
}
