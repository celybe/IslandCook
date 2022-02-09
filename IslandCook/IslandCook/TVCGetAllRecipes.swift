//
//  TVCGetAllRecipes.swift
//  IslandCook
//
//  Created by Xavi Giron on 9/2/22.
//

import UIKit

class TVCGetAllRecipes: UITableViewController {
    
    var decodeData: [Datos] = []
    let origen = "Server"
//    let origen = "Local"
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if origen == "Local" {
            var url = loadDataFromLocalUrl()
            decodeJson(url: url)
        }
        else {
            let url = loadDataFromremoteUrl()
            decodeJson(url: url)
        }
        
    }
    
    func decodeJson(url: URL)
    {
        do
        {
            let decoder = JSONDecoder()
            let datosArchivo = try Data(contentsOf: url)
            
            decodeData = try decoder.decode([Datos].self, from: datosArchivo)
        }
        catch
        {
            print("Error, no se puede parsear el archivo")
        }
        
        
    }
    
    
    
    func loadDataFromLocalUrl() -> URL
    {
        guard let url = Bundle.main.url(forResource: "recipes", withExtension: "json") else {
            fatalError("No se encuentra el archivo JSON en el Bundle")
        }
        return url
    }
    
    
    func loadDataFromremoteUrl() -> URL
    {
        guard let url = URL(string: "https://island-cook.herokuapp.com/api/recipe") else {
            fatalError("No se encuentra el JSON en la ruta remota")
        }
        return url
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return decodeData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = decodeData [indexPath.row].name
        cell.imageView?.image = decodeData [indexPath.row].picture_url as? UIImage

        return cell
    }

}
