//
//  CVCMyRecipes.swift
//  IslandCook
//
//  Created by Aracely on 16/2/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class CVCMyRecipes: UICollectionViewController {

    let myRecipesExamples : [String] = ["https://cdn.vox-cdn.com/thumbor/DQneqacgrmet47pxQDwvDqhBYSI=/0x0:900x1125/920x613/filters:focal(478x728:622x872):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/68862911/La_Comida_tacos.0.jpg","https://cdn.vox-cdn.com/thumbor/r6lodJrk_CHIO101QRLWwwAJ_EM=/0x0:1600x800/920x613/filters:focal(672x272:928x528):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/63656524/Comida.0.png","https://cdn.aarp.net/content/dam/aarp/health/caregiving/2018/03/1140-nutrients-food-loved-ones-caregiving-esp.imgcache.rev.web.700.403.jpg"]
    
    let myRecipesLabels : [String] = ["Receta 1","Receta 2","Receta 3"]

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myRecipesExamples.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        var cell = UICollectionViewCell()
        if let recipeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as? CVCellMyRecipes {
            recipeCell.configure(with: myRecipesLabels[indexPath.row],recipeImage: myRecipesExamples[indexPath.row])
            cell = recipeCell
        }
        return cell
    }

}
