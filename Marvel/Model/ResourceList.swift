//
//  ResourceList.swift
//  Marvel
//
//  Created by Paul Jaime Felix Flores on 16/08/24.
//

import Foundation

/*
 Resourcelist tiene una caracteristica importante y tenemos 4 nodos.
Creamos una estructura ResourceList,pero cabra cualquiera de los 3 nodos.
 Aplicamos el concepto de generics : La función recibe lo que sea ,pero debe ser codable
 y el Resourcelist tambien debe ser codable.
 */
struct ResourceList<T : Codable> : Codable {
    //Paso 10
    let available : Int
    let collectionURI : String
    let items : [T]//Tenemos un array de items,es una array del tipo que le mande.
    let returned : Int
}
