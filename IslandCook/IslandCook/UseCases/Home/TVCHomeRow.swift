//
//  TVCHomeRow.swift
//  IslandCook
//
//  Created by user211717 on 2/13/22.
//

import UIKit

class TVCHomeRow: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var recipesList : [DatosDetalle] = APIService.shared.decodeJson()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization
        recipesList.shuffle()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //Funciones colección
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellTopRecipes", for: indexPath) as! CVCHome
        cell.txtTitle.text = recipesList[indexPath.row].name
        cell.ivRecipe.downloaded2(from: recipesList[indexPath.row].picture_url )
        cell.ivRecipe.layer.cornerRadius = 15
        return cell
    }
    func collectionView(_ collectionView:UICollectionView,layout UICollectionViewLayout: UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath)-> CGSize{
        return CGSize(width: 190, height: 250)
    }

}
