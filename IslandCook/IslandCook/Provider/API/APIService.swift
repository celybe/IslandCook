//
//  APIService.swift
//  IslandCook
//
//  Created by user211717 on 2/13/22.
//

import Foundation

class APIService{
    private var decodeData: [ApiResponse] = []
//    guard let celdaSeleccionada = TVCGetAllRecipes.
//    var id_intercambio = decodeData[celdaSeleccionada]._id
    
    static let shared: APIService = {
        let apiService = APIService()
        return apiService
    }()
    
    
    // Decodificamos archivo parseado
    func decodeJson(endpoint: String) -> [ApiResponse]{
        do{
            let decoder = JSONDecoder()
            let datosArchivo = try Data(contentsOf: loadDataFromremoteUrl(endpoint: endpoint))
            decodeData = try decoder.decode([ApiResponse].self, from: datosArchivo)
            print(decodeData)
        }catch let error{
            print("errorr:::::: \(error)")
            ACGetRecipies()
        }
        return decodeData
    }
    
    // Cargamos datos de nuestro server
    private func loadDataFromremoteUrl(endpoint: String) -> URL{
        guard let url = URL(string: "https://island-cook.herokuapp.com/api/recipe\(endpoint)") else {
            fatalError("No se encuentra el JSON en la ruta remota")
        }
        return url
    }
    
    func postRecipe(recipe: ApiBody) {
        // creamos la petición post
        let url = URL(string: "https://island-cook.herokuapp.com/api/recipe")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let data = [
            "name" : recipe.name,
            "picture_url": recipe.picture_url,
            "difficultity":recipe.difficulty,
            "author": recipe.author,
            "steps": recipe.steps,
            "ingredients": recipe.ingredients,
            "tags": recipe.tags
        ] as? [String: Any]
        
        let bodyData = try? JSONSerialization.data(withJSONObject: data)
        request.httpMethod = "POST"
        request.httpBody = bodyData
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(error)
            } else if let data = data {
                // Handle HTTP request response
                print(data)
            } else {
                // Handle unexpected error
            }
        }
        task.resume()
    }
    
    func putRecipe(id: String) {
        // creamos la petición put
        let url = URL(string: "https://island-cook.herokuapp.com/api/recipe\(id)")!//Falta añadir id
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                ACPutRecipes()
                print(error)
                return
            }
            print ("RESPUESTA: \(response)")
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
            }
            print(responseJSON)
        }
    }
    
    
    func deleteRecipe(id: String) {
        // creamos la petición delete
        let url = URL(string: "https://island-cook.herokuapp.com/api/recipe\(id)")!//Falta añadir id
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                VCAlertDelete()
                return
            }
            print ("RESPUESTA: \(response)")
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
            }
            print(responseJSON)
        }
    }
}

