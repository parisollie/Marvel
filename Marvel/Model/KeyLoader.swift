//
//  KeyLoader.swift
//  Marvel
//
//  Created by Paul Jaime Felix Flores on 10/10/23.
//

import Foundation

class KeyLoader{
    static let shared = KeyLoader()
    
    var privateKey = ""
    var publicKey = ""
    var ts = ""
    var hash = ""
    //Metodo init para cargar las llaves
    //    init method load keys from file
    private init() {
        //Hacemos una peticion del bundle en nuestra app
        //bundle es el conjunto de informacion de nuestra app
        if let file = Bundle.main.url(forResource: "marvel", withExtension: "keys"){
            do{
                //Intentamos decodificar nuestra estrictura del json ,donde tenemos nuestras llaves
                //contens of ,de donde sacamos el dato de nuestro archivo
                let data = try Data(contentsOf: file)
                //y si es posible decodificamos nuestras variables
                let myKeys = try JSONDecoder().decode(Keys.self, from: data)
                //Le pasamos el valor de las variables 
                privateKey = myKeys.privateKey
                publicKey = myKeys.publicKey
            }
            catch{
                print("Error: ")
            }
        }
    }
    
    
    //        MARK: API params
    /*
     ts = timestamp
     apikey : public key
     hash param : a md5 digest of the ts parameter, your private key and your public key (e.g. md5(ts+privateKey+publicKey)
     */
    //Paso 2, recibe como parámetro nuestro time spant la llave privada.
    func getAPIParams() -> (ts: String, hash: String, apiKey: String){
        ts = (Date().timeIntervalSince1970).asString
        //Nesito estos 3 parámetros para hacer mi llamada.
        return (ts,(ts+self.privateKey+self.publicKey).md5, self.publicKey)
    }
    /*Regresa el query string, es una cadena con los parámetros y sus respectivos parametros que yo estaré
    enviando.
     
     http://gateway.marvel.com/v1/public/creators/32?ts=1723844902.0892801&hash=6208d9145c25a5f8842d4786a60b4bec&apikey=00a74833542603937157ca50582ca1f3
     
     https://codebeautify.org/jsonviewer
     
     
     */
    
    
    
    func getQueryString() -> String {
        ts = (Date().timeIntervalSince1970).asString
        hash = (ts+self.privateKey+self.publicKey).md5
        return "ts="+ts+"&hash="+hash+"&apikey="+self.publicKey
    }
    
    func getQueryString(limit: Int, offset: Int) -> String {
        ts = (Date().timeIntervalSince1970).asString
        hash = (ts+self.privateKey+self.publicKey).md5
        return "ts="+ts+"&hash="+hash+"&apikey="+self.publicKey+"&limit="+String(limit)+"&offset="+String(offset)
    }
}
