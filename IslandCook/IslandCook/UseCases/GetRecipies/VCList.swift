//
//  VCList.swift
//  IslandCook
//
//  Created by user211717 on 2/22/22.
//

import UIKit

class VCList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mitabla: UITableView!
    var filterEndPoint: String = ""
    var decodeData: [ApiResponse] = []
    var urlImg: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(filterEndPoint)
        decodeData = APIService.shared.decodeJson(endpoint: filterEndPoint)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return decodeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TVCRecipeList else { fatalError()}
        urlImg = decodeData[indexPath.row].picture_url
        cell.lblRecipeName.text = decodeData [indexPath.row].name
        cell.lblRecipeListAuthor.text = decodeData [indexPath.row].author
        cell.ivRecipeList.downloaded(from: urlImg!)
        cell.ivRecipeList.layer.cornerRadius = 10
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let celdaSeleccionada = mitabla.indexPathForSelectedRow?.row else {return}
        let postSeleccionado = decodeData[celdaSeleccionada]
        let vistaDetalle = segue.destination as! VCDetailRecipe

        vistaDetalle.miReceta = postSeleccionado
    }
    
    
}
