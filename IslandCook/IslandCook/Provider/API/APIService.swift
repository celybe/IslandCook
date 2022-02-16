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
        }catch{
            print("Error, no se puede parsear el archivo")
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
    
    func postRecipe() {
        // creamos la petición post
        let url = URL(string: "https://island-cook.herokuapp.com/api/recipe")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No hay datos")
                return
            }
            print ("RESPUESTA: \(response)")
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
            }
            print(responseJSON)
        }
    }
    
    func putRecipe(id: String) {
        // creamos la petición put
        let url = URL(string: "https://island-cook.herokuapp.com/api/recipe\(id)")!//Falta añadir id
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No hay datos")
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
                print(error?.localizedDescription ?? "No hay datos")
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

