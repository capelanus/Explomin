//
//  Variables.swift
//  Explomin
//
//  Created by Daniel López on 17/09/17.
//  Copyright © 2017 Daniel López. All rights reserved.


import UIKit

class Variables: UIViewController {

   
    static var adix2 = [[ : ]] //variable aditivo para formulario (listo)
    static var matx2 = [[ : ]] // variable materiales perdidos para formulario (listo)
    static var actix2 = [[ : ]] // variable actividades para formulario (listo)
    static var accex2 = [[ : ]] // variable accesorios (listo)
    static var brocax2 = [[ : ]] // variable para brocas (listo)
    static var corrx2 = [[ : ]] // variable corridas (listo)


    ///////variables para  los array actividades y maquinas de proyectoadmin///////////////
    
    static var actix3 = [String]()
    static var maquix3 = [String]()
    
    
    //////VARIABLES PARA EL FORMULARIO/////////////////////////
    
    static var minera = String()
    static var negocio = String()
    static var nombreproy = String()
    static var keyq = String()
    
    
    
////////////VARIABLE KEY DEL FORMULARIO QUE EL SUPERVISOR VA A REVISAR/////
    
    static var keyxs = String()
    
    
////////////VARIABLE array DEL FORMULARIO QUE EL SUPERVISOR VA A REVISAR/////

    static var adi4 = [String]()
    static var mat4 = [String]()
    static var acti4 = [String]()
    static var mue4 = [String]()
    static var bro4 = [String]()
    static var acc4 = [String]()
    
////////VARIABLE cliente nombre de la empresa////////
    
    static var empresaCli = String()

    
    
    
    
    static var acti2 = [String]() //las actividades a incluir en ProyectoAdmin
    static var maqui2 = [String]() // las máquinas disponibles
    static var perfo2 = [Perforista]()
    static var perforistaX = [Perforista]()
    static var key = String() // la key del proyecto
    static var material = [Material]()
    
    
    

}
