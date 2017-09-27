//
//  FormularioViewController.swift
//  Explomin
//
//  Created by Daniel López on 13/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import UIKit
import Firebase


class FormularioViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var segmentedTurn: UISegmentedControl!
    
    @IBOutlet weak var taladroTextField: UITextField!
    
    @IBOutlet weak var zonaTextField: UITextField!
    @IBOutlet weak var azimuTextField: UITextField!
    
    @IBOutlet weak var incliTextField: UITextField!
    @IBOutlet weak var minicialTextField: UITextField!
    @IBOutlet weak var mfinalTextField: UITextField!
    
    @IBOutlet weak var nombrePerforistaTextField: UITextField!
    @IBOutlet weak var ayudante1TextField: UITextField!
    @IBOutlet weak var ayudante2TextField: UITextField!
    @IBOutlet weak var supervisorTextField: UITextField!
    
    @IBOutlet weak var horoInicialTextField: UITextField!
    @IBOutlet weak var horoFinalTextField: UITextField!
    
    @IBOutlet weak var combusTextField: UITextField!
    
    @IBOutlet weak var maquinaTextFIeld: UITextField!
    
    
    @IBOutlet weak var fechaTextField: UITextField!
    
    
    
    
    var turno : String = "Turno A"
    var picker = UIPickerView()
    var arrayMaquinas = [String]()
    
    var unidadnegocio = String()
    var nombrepro = String ()
    var minera = String()
    var key = String()


    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        
        arrayMaquinas = Variables.maquix3
        maquinaTextFIeld.inputView = picker
        
        unidadnegocio = Variables.negocio
        nombrepro = Variables.nombreproy
        minera = Variables.minera
            key = Variables.keyq
        

    }
    
   
    
    @IBAction func send(_ sender: Any) {
        
        
        
        
        let taladro = taladroTextField.text
        let zona = zonaTextField.text
        let inclinacion = incliTextField.text
        let azimuth = azimuTextField.text
        
        let inicial = minicialTextField.text
        let final = mfinalTextField.text
        
        let perforista = nombrePerforistaTextField.text
        let ayu1 = ayudante1TextField.text
        let ayu2 = ayudante2TextField.text
        let supervisor = supervisorTextField.text
        
        let hinicial = horoInicialTextField.text
        let hfinal = horoFinalTextField.text
        
        let gas = combusTextField.text
        let fecha = fechaTextField.text
        
        let maquina = maquinaTextFIeld.text
        
        
        let form : [String : AnyObject] = ["taladro" :taladro as AnyObject,
                                           "zona" : zona as AnyObject,
                                          "inclinacion" : inclinacion as AnyObject,
                                           "azimut" : azimuth as AnyObject,
                                           "aditivos": Variables.adix2 as AnyObject,
                                           "accesorios": Variables.accex2 as AnyObject,
                                           "brocas": Variables.brocax2 as AnyObject,
                                           "actividades": Variables.actix2 as AnyObject,
                                           "corrida": Variables.corrx2 as AnyObject,
                                           
                                           "id" : "no" as AnyObject,
                                           
                                           "unidad de negocio" : unidadnegocio as AnyObject,
                                           "nombreproyecto" : nombrepro as AnyObject,
                                           "minera" : minera as AnyObject,
                                           "keypro" : key as AnyObject,


                                           "maquina" : maquina as AnyObject,
                                           "metraje final" :final as AnyObject,
                                           "metraje inicial" : inicial as AnyObject,
                                           
                                           "perforista" : perforista as AnyObject,
                                           "ayudante1" : ayu1 as AnyObject,
                                           "ayudante2" : ayu2 as AnyObject,
                                           "supervisor" : supervisor as AnyObject,
                                           
                                           "horometro final" : hinicial as AnyObject,
                                           "horometro inicial" : hfinal as AnyObject,
                                           
                                           "materialesPerdidos" : Variables.matx2 as AnyObject,
            
                                           "combustible" : gas as AnyObject,
                                           "fecha" : fecha as AnyObject,
                                           "turno" : turno as AnyObject]
        
        
       let databaseRef = Database.database().reference()
        
        let ref1 = databaseRef.child("explomin").child("Formularios2").childByAutoId()
        ref1.setValue(form)
        
        let postId = ref1.key
        
        print("este es el id recien creado", postId)
        
        taladroTextField.text = ""
        zonaTextField.text = ""
        incliTextField.text = ""
        azimuTextField.text = ""
        
        minicialTextField.text = ""
        mfinalTextField.text = ""
        
        nombrePerforistaTextField.text = ""
        ayudante1TextField.text = ""
        ayudante2TextField.text = ""
        supervisorTextField.text = ""
        
         horoInicialTextField.text = ""
        horoFinalTextField.text = ""
        
        combusTextField.text = ""
        fechaTextField.text = ""
        
         maquinaTextFIeld.text = ""
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func indexCHanged(_ sender: Any) {
        
        switch segmentedTurn.selectedSegmentIndex{
        
        case 0:
                print("1")
                turno = "Turno A"
        
        case 1:
                print("2")
                turno = "Turno B"
            
        default: break
        
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1"{
        
           /* let sendingVC : AditivoViewController = segue.destination as! AditivoViewController
            
            sendingVC.delegate = self*/
            
            print("esta wa funciona")
        
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return arrayMaquinas[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return arrayMaquinas.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
       // tipo1 = tipos[row]
        maquinaTextFIeld.text = arrayMaquinas[row]
        self.view.endEditing(false)
        
    }

   
    
    
     

}
