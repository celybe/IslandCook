//
//  APIService.swift
//  IslandCook
//
//  Created by user211717 on 2/13/22.
//

import Foundation

class APIService{
    private var decodeData: [DatosDetalle] = []
    
    static let shared: APIService = {
        let apiService = APIService()
        return apiService
    }()
    
    
    // Decodificamos archivo parseado
    func decodeJson() -> [DatosDetalle]{
        do{
            let decoder = JSONDecoder()
            let datosArchivo = try Data(contentsOf: loadDataFromremoteUrl())
            decodeData = try decoder.decode([DatosDetalle].self, from: datosArchivo)
        }catch{
            print("Error, no se puede parsear el archivo")
        }
        return decodeData
    }
    
    // Cargamos datos de nuestro server
    private func loadDataFromremoteUrl() -> URL{
        guard let url = URL(string: "https://island-cook.herokuapp.com/api/recipe") else {
            fatalError("No se encuentra el JSON en la ruta remota")
        }
        return url
    }
}
