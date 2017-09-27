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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        corridas = []

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addRow(_ sender: Any) {
        
        let from = desdeTextField.text
        let to = hastaTextField.text
        let lon = longTextFIeld.text
        
        //let corri = Corrida(desde : from!, hasta : to!, testigo : lon! )
        
        let corri : [String:AnyObject] = ["desde": from as AnyObject, "hasta": to as AnyObject, "longitud": lon as AnyObject]

        corridas.append(corri)
        
        desdeTextField.text = ""
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

        
        
        
        return cell
    }

   
    @IBAction func send(_ sender: Any) {
        
        Variables.corrx2 = corridas
        dismiss(animated: true, completion: nil)
    }

}
