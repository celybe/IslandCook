//
//  TVCHomeRow.swift
//  IslandCook
//
//  Created by user211717 on 2/13/22.
//

import UIKit

class TVCHomeRow: UITableViewCell {
    //Llamada al singelton y almacenamiento de la lista de recetas a mostrar
    private var recipesList : [ApiResponse] = APIService.shared.decodeJson(endpoint: "")
    private var recipeId: String = ""


    override func awakeFromNib() {
        super.awakeFromNib()
        // mezcla la lista
        recipesList.shuffle()    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //Asigna el ancho y alto de la collection view
    func collectionView(_ collectionView:UICollectionView,layout UICollectionViewLayout: UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath)-> CGSize{
        return CGSize(width: UIScreen.main.bounds.width, height: 250)
    }
}
