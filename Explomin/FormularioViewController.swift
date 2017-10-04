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
    
    @IBOutlet weak var tmetrosLabel: UILabel!
    @IBOutlet weak var thorasLabel: UILabel!
    
    @IBOutlet weak var terrenoTextField: UITextField!
    
    @IBOutlet weak var muestrasL: UIButton!
    @IBOutlet weak var aditivoL: UIButton!
    @IBOutlet weak var materialesL: UIButton!
    @IBOutlet weak var actividadesL: UIButton!
    @IBOutlet weak var brocaL: UIButton!
    @IBOutlet weak var accesoriosL: UIButton!
    
    
    var turno : String = "Turno A"
    
    var picker = UIPickerView()
    var picker2 = UIPickerView()
    
    var arrayMaquinas = [String]()
    
    var unidadnegocio = String()
    var nombrepro = String ()
    var minera = String()
    var key = String()
    
    var desde = 0
    var hasta = 0
    
    var desde1 = 0
    var hasta1 = 0
    
    var terrenos = ["Arcilloso","Arenoso","Compacto","Duro","Fracturado"]



    
    
    
    override func viewDidLoad() {
        
        muestrasL.layer.cornerRadius = 10
        muestrasL.clipsToBounds = true
        
        aditivoL.layer.cornerRadius = 10
        aditivoL.clipsToBounds = true
        
        materialesL.layer.cornerRadius = 10
        materialesL.clipsToBounds = true
        
        actividadesL.layer.cornerRadius = 10
        actividadesL.clipsToBounds = true
        
        brocaL.layer.cornerRadius = 10
        brocaL.clipsToBounds = true
        
        accesoriosL.layer.cornerRadius = 10
        accesoriosL.clipsToBounds = true
        
        
        super.viewDidLoad()
        
        setupNavigationBar()
        
        getDate()
        
        picker.delegate = self
        picker.dataSource = self
        
        picker2.delegate = self
        picker2.dataSource = self
        
        arrayMaquinas = Variables.maquix3
        
        maquinaTextFIeld.inputView = picker
        terrenoTextField.inputView = picker2
        
        unidadnegocio = Variables.negocio
        nombrepro = Variables.nombreproy
        minera = Variables.minera
            key = Variables.keyq
        
        minicialTextField.addTarget(self, action: #selector(textOnTextFieldDidChange(textField:)), for: .editingChanged)
        
        mfinalTextField.addTarget(self, action: #selector(textOnTextFieldDidChange(textField:)), for: .editingChanged)
        
        horoInicialTextField.addTarget(self, action: #selector(textOnTextFieldDidChange2(textField:)), for: .editingChanged)
        
          horoFinalTextField.addTarget(self, action: #selector(textOnTextFieldDidChange2(textField:)), for: .editingChanged)
        
        

    }
    
    
    private func getDate(){
    
    
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd/MM/yyyy"
        let result = formatter.string(from: date)
        
        fechaTextField.text = result
    
    
    
    }
    private func setupNavigationBar(){
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "explo"))
        titleImageView.frame = CGRect(x:-57, y:0, width: 86, height: 30)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
    }
    
    func textOnTextFieldDidChange(textField: UITextField){
    
    
        if textField === minicialTextField {
            desde = Int(textField.text!) ?? 0
        } else if textField === mfinalTextField {
            hasta = Int(textField.text!) ?? 0
        }
        
        
        if self.minicialTextField.text != "" && self.mfinalTextField.text != "" {
        
            let total = hasta - desde
            let totals = String(total)
            
            self.tmetrosLabel.text = totals
            
            
        }
        
       
    
    
    }
    
    func textOnTextFieldDidChange2(textField: UITextField){
    
    
        if textField === horoInicialTextField {
            desde1 = Int(textField.text!) ?? 0
        } else if textField === horoFinalTextField {
            hasta1 = Int(textField.text!) ?? 0
        }
        
        if self.horoFinalTextField.text != "" && self.horoInicialTextField.text != ""{
        
            let total = hasta1 - desde1
            let totals = String(total)
            
            self.thorasLabel.text = totals
            
            
        }
        
      
    
    
    
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
                                           "proyecto" : key as AnyObject,


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
    
    
    
    
    //Picker////////
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == picker2{
            
            return terrenos[row]
            
        }
        
       
            
          return arrayMaquinas[row]
            
        
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == picker{
            
            return arrayMaquinas.count
        }
        
        
            
            return terrenos.count
        

        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
       
        
        if pickerView == picker{
            
            maquinaTextFIeld.text = arrayMaquinas[row]
            self.view.endEditing(false)        }
        
        
        if pickerView == picker2{
            
            terrenoTextField.text = terrenos[row]
            self.view.endEditing(false)
            
            
        }

        
    }
    
  

   
    
    
    

}
