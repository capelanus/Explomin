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
    
    var horas = [Int]()
    var minutos = [Int]()

    
    @IBOutlet weak var actividadTextfield: UITextField!
    @IBOutlet weak var inicioTextField: UITextField!
    @IBOutlet weak var finTextField: UITextField!
    @IBOutlet weak var myTable: UITableView!
    @IBOutlet weak var ok: UIButton!
    
    var picker = UIPickerView()
    
    var picker2 = UIPickerView()
    var picker3 = UIPickerView()
    
    var minutoQ = String()
    var horaQ = String()

    
    
    
    
    
   


    override func viewDidLoad() {
        super.viewDidLoad()
        
        ok.layer.cornerRadius = 10
        ok.clipsToBounds = true
        
        inicioTextField.text = "07:00"
        
        picker.delegate = self
        picker.dataSource = self
        
        picker2.delegate = self
        picker2.dataSource = self
        
        picker3.delegate = self
        picker3.dataSource = self
        
        actividadTextfield.inputView = picker
        inicioTextField.inputView = picker2
        finTextField.inputView = picker3
        
        arrayActividades = Variables.actix3
        
        arrayAgregadas = []
        horas = [00,01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
        
        minutos = [00,5,10,15,20,25,30,35,40,45,50,55]
        
       
    
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 /*   func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        guard let label = view as? UILabel else {
            preconditionFailure ("Expected a Label")
        }
        
        label.font = UIFont(name: "Avenir Next", size: 25)

        return label
        
        
    }*/
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
       
        if pickerView == picker{
            
            return 1
            
        }
        
            
        else{
        
        return 2
            
            
        }
        
        
        
        
    }
    
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        if pickerView == picker{
            
            return arrayActividades[row]
            
        }else{
        
        
            if component == 0 {
                return String(horas[row])
            } else {
                
                return String(minutos[row])
            }
        
        
        }
        
        
    }
    
    
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        
        if pickerView == picker{
            
            return arrayActividades.count
            
        }
        else{
        
            if component == 0 {
                
                return horas.count
            }
                
            else {
                
                return minutos.count
            }
        
        
        
        }
    }
    
    
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if pickerView == picker{
            
            
            self.actividadTextfield.text = arrayActividades[row]
            self.view.endEditing(false)

            
        }
        
            
            
        if pickerView == picker2{
            
            
            
                

                 horaQ = String(horas[row])

                
                minutoQ = String(minutos[row])

            
            

        
            
            let total = horaQ + String(" : ") + minutoQ
            self.finTextField.text = total
        
        
        }
        
        if pickerView == picker3{
        
        
            if component == 0 {
                
                horaQ = String(horas[row])
            }
            else{
                minutoQ = String(minutos[row])

            
            }
            
            
            
            
            
            
            if horaQ != "" && minutoQ != ""
            {
            
                let total = horaQ + String(" : ") + minutoQ
                self.finTextField.text = total
                
            }
           
        
        
        }
    
        
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
