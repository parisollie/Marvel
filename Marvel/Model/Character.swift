//
//  Character.swift
//  Marvel
//
//  Created by Paul Jaime Felix Flores on 10/10/23.
//

import Foundation
//Paso 4,Swift
struct Character : Codable {
    //Paso 5,Ponemos los atributos de acuerdo a a pagina de marvel.
    //https://developer.marvel.com/documentation/entity_types
    let id : Int
    let name : String
    let description : String
    let modified : String
    let resourceURI : String
    //Paso 6,thumbnail me regresa dos nodos, y debemos crear 2 estructuras
    let thumbnail : Image //Struct
    //Paso 7
    let urls : [URLWebSite] //Struct,tiene dos atributos.
    //Paso 9, los siguientes elementos tienen ResourceList
    let comics : ResourceList<ComicItem>
    //Paso 11
    let stories : ResourceList<StoryItem>
    //Paso 12
    let events : ResourceList<EventItem>
    //Paso 13 , este es diferente a los 3 anteriores.
    let series : ResourceList<SerieItem>
}
