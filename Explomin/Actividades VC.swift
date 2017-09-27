//
//  Actividades VC.swift
//  Explomin
//
//  Created by Daniel López on 23/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit

class Actividades_VC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var arrayActividades = [String]()
    var arrayAgregadas = [[String: AnyObject]]()

    var hora = String()
    var dic = [String : AnyObject]()
    var tipos = [[String:AnyObject]]()
    var xeo = [String]()

    
    @IBOutlet weak var actividadTextfield: UITextField!
    @IBOutlet weak var inicioTextField: UITextField!
    @IBOutlet weak var finTextField: UITextField!
    
    @IBOutlet weak var myTable: UITableView!
    
    var picker = UIPickerView()
    
   


    override func viewDidLoad() {
        super.viewDidLoad()
        
        inicioTextField.text = "00:00"
        
        picker.delegate = self
        picker.dataSource = self
        
        actividadTextfield.inputView = picker
        
        arrayActividades = Variables.actix3
        arrayAgregadas = []
        
       
    
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return arrayActividades[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return arrayActividades.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
      //  tipo1 = arrayActividades[row]
        actividadTextfield.text = arrayActividades[row]
        self.view.endEditing(false)
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = self.myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ActividadesCell
        
        let dom = self.arrayAgregadas[indexPath.row]
        //let material  = arrayMateriales[indexPath.row]

        
        cell.actividadLabel.text = dom["actividad"] as? String
        cell.inicioLabel.text = dom["inicio"] as? String
        cell.finLabel.text = dom["final"] as? String
        
        
        return cell
    
    
    }
    
  
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayAgregadas.count
    }
    
   
    @IBAction func addCell(_ sender: Any) {
        
        
        let act = self.actividadTextfield.text
        let ini = self.inicioTextField.text
        let fin = self.finTextField.text
        
        let dic :[String:AnyObject] = ["actividad":act as AnyObject,"inicio": ini as AnyObject,"final": fin as AnyObject]

      self.arrayAgregadas.append(dic)
        
        
        self.actividadTextfield.text = ""
        self.finTextField.text = ""
        self.inicioTextField.text = fin
        
        
        self.myTable.reloadData()
        
        
        
    }
    

    @IBAction func send(_ sender: Any) {
        
        
        Variables.actix2 = arrayAgregadas
        print(self.arrayActividades)
        dismiss(animated: true, completion: nil)
        

        
    }
    

}
