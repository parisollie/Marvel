//
//  Image.swift
//  Marvel
//
//  Created by Paul Jaime Felix Flores on 10/10/23.
//

import Foundation

struct Image : Codable {
    //Paso 7,Le ponemos las propiedades de la página de marvel.
    let path : String
    let fileExtension : String
    //Paso 8,creamos una propiedad calculada ,para que las llame.
    var url : String{
        return path + "." + fileExtension
    }
    
    enum CodingKeys : String, CodingKey{
        //Paso 9,Hacemos el mapeo de nuestra estructura para que no cause prolema con la api.
        case path = "path"
        case fileExtension = "extension"
    }
}
