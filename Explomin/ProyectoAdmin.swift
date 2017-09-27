//
//  ProyectoAdmin.swift
//  Explomin
//
//  Created by Daniel López on 21/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import Foundation

struct ProyectoAdmin{
    
  //  let actividades : [String: AnyObject]
    let cliente : String
    //let equipos : [String: AnyObject]
    let fecha : String
    let unidadNegocio : String
    let id : String
    let nombre : String
    
    init(cliente : String,  fecha: String, unidadNegocio: String, id: String,  nombre: String) {
        
        //self.actividades = actividades
        self.cliente = cliente
       // self.equipos = equipos
        self.fecha = fecha
        self.unidadNegocio = unidadNegocio
        self.id = id
        self.nombre = nombre
        
    }
}
