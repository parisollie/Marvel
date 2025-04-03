//
//  DataResponse.swift
//  Marvel
//
//  Created by Paul Jaime Felix Flores on 16/08/24.
//


import Foundation
//Paso 15,
struct DataResponse<T : Codable> : Codable {
    let offset : Int
    let limit : Int
    let total : Int
    let count : Int
    let results : [T]
}
