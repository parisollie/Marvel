//
//  Keys.swift
//  Marvel
//
//  Created by Paul Jaime Felix Flores on 10/10/23.
//

import Foundation

struct Keys : Codable {
    let privateKey : String
    let publicKey : String
    
    private init(privateKey : String, publicKey : String){
        self.privateKey = privateKey
        self.publicKey = publicKey
    }
    
    //Coding Keys Enum
    enum CodingKeys : String, CodingKey{
        case privateKey = "private_key"
        case publicKey = "public_key"
    }
}
