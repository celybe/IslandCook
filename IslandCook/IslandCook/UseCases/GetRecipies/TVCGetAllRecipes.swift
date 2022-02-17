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
        print(filterEndPoint)
        decodeData = APIService.shared.decodeJson(endpoint: filterEndPoint)
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

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        urlImg = decodeData[indexPath.row].picture_url
        cell.textLabel?.text = decodeData [indexPath.row].name
        cell.imageView?.downloaded(from: urlImg!)

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let celdaSeleccionada = miTabla.indexPathForSelectedRow?.row else {return}
        let postSeleccionado = decodeData[celdaSeleccionada]
        let vistaDetalle = segue.destination as! VCDetailRecipe

        vistaDetalle.miReceta = postSeleccionado
    }


    @IBOutlet var miTabla: UITableView!
}
