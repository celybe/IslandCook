//
//  TVCGetAllRecipes.swift
//  IslandCook
//
//  Created by Xavi Giron on 9/2/22.
//

import UIKit

class TVCGetAllRecipes: UITableViewController {

    var filterEndPoint: String = ""
    var decodeData: [ApiResponse] = []
    var urlImg: String?
//    let origen = "Local"
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        print(filterEndPoint)
        decodeData = APIService.shared.decodeJson(endpoint: filterEndPoint)
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return decodeData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 150
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TVCRecipeList
        urlImg = decodeData[indexPath.row].picture_url
        cell!.lblRecipeName.text = decodeData [indexPath.row].name
        cell!.lblRecipeListAuthor.text = decodeData [indexPath.row].author
        cell!.ivRecipeList.downloaded(from: urlImg!)
        cell!.ivRecipeList.layer.cornerRadius = 10
        return cell!
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let celdaSeleccionada = miTabla.indexPathForSelectedRow?.row else {return}
        let postSeleccionado = decodeData[celdaSeleccionada]
        let vistaDetalle = segue.destination as! VCDetailRecipe

        vistaDetalle.miReceta = postSeleccionado
    }
    @IBOutlet var miTabla: UITableView!
}
