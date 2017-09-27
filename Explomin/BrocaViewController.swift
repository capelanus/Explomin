//
//  BrocaViewController.swift
//  Explomin
//
//  Created by Daniel López on 16/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import Firebase



class BrocaViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var brocas = [[:]]
    
    @IBOutlet weak var tipoTextField: UITextField!
    @IBOutlet weak var marcaTextField: UITextField!
    @IBOutlet weak var serieTextField: UITextField!
    
    @IBOutlet weak var diamSegment: UISegmentedControl!
    @IBOutlet weak var condSegment: UISegmentedControl!

    @IBOutlet weak var desdeTextField: UITextField!
    @IBOutlet weak var hastaTextField: UITextField!
    
    var picker = UIPickerView()
    
    var arrayTipos = ["Broca","R.Shell","Casing Shoe","Triconos"]
    var diametro : String = "HQ"
    var estado : String = "Nuevo"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        
        tipoTextField.inputView = picker

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addDrill(_ sender: Any) {
        
        
       

        
        let tipo2 = tipoTextField.text
        let marca2 = marcaTextField.text
        let serie2 = serieTextField.text
        let diametro2 = diametro
        let estado2 = estado
        let desde2 = desdeTextField.text
        let hasta2 = hastaTextField.text
        
        
        
        let bro : [String : AnyObject] = ["tipo": tipo2 as AnyObject,"marca":marca2 as AnyObject,"serie": serie2 as AnyObject,"diametro": diametro2 as AnyObject,"estado": estado2 as AnyObject,"desde": desde2 as AnyObject,"hasta": hasta2 as AnyObject]
       
        
        brocas.append(bro)
        print(brocas)
        
        Variables.brocax2 = brocas
        
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return arrayTipos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return arrayTipos[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        tipoTextField.text = arrayTipos[row]
        self.view.endEditing(false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func segDiam(_ sender: Any) {
        
        switch diamSegment.selectedSegmentIndex{
        
        case 0:
            print("1")
        case 1:
            print("2")
            diametro = "NQ"
        case 2:
            print("3")
            diametro = "BQ"
            
        default:break
            
        
        }
        
        
    }

    @IBAction func segCond(_ sender: Any) {
        
        switch condSegment.selectedSegmentIndex {
            
        case 0:
            print("1")
        case 1:
            print("2")
            estado = "Usado"
            
        default:break
 
        }
        
    }
    
    
    
}
