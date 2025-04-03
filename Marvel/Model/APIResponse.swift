//
//  APIResponse.swift
//  Marvel
//
//  Created by Paul Jaime Felix Flores on 16/08/24.
//

import Foundation

//Paso 14, para pasar la respuesta completa,usamos tambien Generics: Acepta el dato que sea.
struct APIResponse<T : Codable>:Codable {
    let code : Int
    let status : String
    let copyright : String
    let attributionText : String
    let attributionHTML : String
    let etag : String
    let data : DataResponse<T>//También maneja un tipo de dato generico.
}
