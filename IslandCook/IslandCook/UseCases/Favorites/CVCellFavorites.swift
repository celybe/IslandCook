//
//  CVCellFavorite.swift
//  IslandCook
//
//  Created by user209640 on 2/15/22.
//

import UIKit

class CVCellFavorite: UICollectionViewCell {
    

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeLabel: UILabel!
    
    func configure(with recipeName:String, recipeImage: String){
        
        self.recipeLabel.text = recipeName
        self.recipeImage.load(urlString: recipeImage)
    }
}
