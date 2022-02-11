//
//  VCDetailRecipe.swift
//  IslandCook
//
//  Created by Xavi Giron on 11/2/22.
//

import UIKit

class VCDetailRecipe: UIViewController {
    
    var decodeData: [DatosDetalle] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = loadDataFromremoteUrl()
        decodeJson(url: url)
    }
    
    //    Decodificamos archivo parseado
        
        func decodeJson(url: URL)
        {
            do
            {
                let decoder = JSONDecoder()
                let datosArchivo = try Data(contentsOf: url)
                
                decodeData = try decoder.decode([DatosDetalle].self, from: datosArchivo)
            }
            catch
            {
                print("Error, no se puede parsear el archivo")
            }
            
            
        }
    
    
    
    func loadRecipe()
    {
        var id = decodeData.count
        
    }
    
    
    
    //    Cargamos datos de nuestro server
        
    func loadDataFromremoteUrl() -> URL
    {
        guard let url = URL(string: "https://island-cook.herokuapp.com/api/recipe") else {
            fatalError("No se encuentra el JSON en la ruta remota")
        }
        return url
    }
    
    
    
    
    
    
    
    @IBOutlet weak var lblNameRecipe: UILabel!
    @IBOutlet weak var ivImageRecipe: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var tvIngredients: UITextView!
    @IBOutlet weak var tvSteps: UITextView!
}

