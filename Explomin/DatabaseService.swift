//
//  DatabaseService.swift
//  Explomin
//
//  Created by Daniel López on 14/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.
//

import Foundation
import Firebase

class DatabaseService{


    static let shared = DatabaseService()
    private init(){}
    
    
    let actividadesref = Database.database().reference().child("explomin").child("Actividades")
    let clientesref = Database.database().reference().child("explomin").child("Clientes")
    let equiposref = Database.database().reference().child("explomin").child("Equipos")
    let proadminref = Database.database().reference().child("explomin").child("ProyectoAdmin")
    let proyectosref = Database.database().reference().child("explomin").child("Proyectos")
    let unegocioref = Database.database().reference().child("explomin").child("UnidadNegocio")
    let usuariosref = Database.database().reference().child("explomin").child("Usuarios")
    let formulariosref = Database.database().reference().child("explomin").child("formularios")


}
