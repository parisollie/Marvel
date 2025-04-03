//
//  CharacterServiceManager.swift
//  Marvel
//
//  Created by Paul Jaime Felix Flores on 17/08/24.
//  actualizando

import Foundation
//Paso 18
class CharacterServiceManager {
    //Ponemos un array de caracteres.
    private var characters : [Character] = []
    var total : Int = 0
    var offset : Int = 0
    var limit : Int = 0
    //Si ya cargue todos los servicios no necesito más.
    var maxItemsLoaded = false
    
    //Cada vez que haga scroll.
    var isLoading = false
    //Paso 19,
    let session = URLSession(configuration: .default)
    
    //Paso 20
    func countCharacter() -> Int{
        return characters.count
    }
    //Paso 21,regresa un caracter
    func getCharacter(at index : Int) -> Character {
        return characters[index]
    }
    /*Paso 22,recibe un queryString que es u a cadena y completion ,que se ejecuta
    después de que mi tarea concluya,escapaing,es una funcion que no recibe nada y no regresa nada
    me sirve para cuando lance la tarea ,se va ejecutar ,corre de forma asincrona */
    func loadCharacterData(queryString : String, completion: @escaping ()->Void) {
        //Construyo la url que le voy a mandar
        let url = URL(string: Constants.apiCharacterUrl+queryString)!
        //Guardo los carcateres
        var loadedCharacters : [Character] = []
        var httpResponse = HTTPURLResponse()
        let request = URLRequest(url: url)
        
        // Creates a data task with a URL request
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: ", error.localizedDescription)
                return
            }
            
            // Check response
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                print("Invalid response")
                httpResponse = (response as? HTTPURLResponse)!
                print("statusCode: ", httpResponse.statusCode)
                return
            }
            
            // Check if there is any data
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Parse and use the data
            do {
                let decodedResponse = try JSONDecoder().decode(APIResponse<Character>.self, from: data)
                //Tomo mi respuesta decodificada
                loadedCharacters = decodedResponse.data.results
                self.limit = decodedResponse.data.limit
                self.offset = decodedResponse.data.offset
                self.total = decodedResponse.data.total
                
                for character in loadedCharacters {
                    self.characters.append(character)
                    print("Ch:",character.name)
                }
                //Válido si ya llegue al número total
                if self.countCharacter() == self.total{
                    self.maxItemsLoaded = true
                    print("All character loaded")
                }
                

            } catch let error{
                /*loadedCharacters = []
                self.limit = 0
                self.offset = 0*/
                print("JSON parsing error: \(error)")
            }
            //es la funcion que se ejecuta cuando mi tarea termine.
            completion()
        }
        
        // Start the task
        task.resume()
    }
}

