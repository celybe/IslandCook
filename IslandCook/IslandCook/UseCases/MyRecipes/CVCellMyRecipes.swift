//
//  CVCellMyRecipes.swift
//  IslandCook
//
//  Created by Aracely on 16/2/22.
//

import UIKit

class CVCellMyRecipes: UICollectionViewCell {
    @IBOutlet weak var lblNameRecipe: UILabel!
    @IBOutlet weak var imageRecipe: UIImageView!
    
    func configure(with recipeName:String, recipeImage: String){
        
        self.lblNameRecipe.text = recipeName
        self.imageRecipe.load(urlString: recipeImage)
        self.imageRecipe.layer.cornerRadius = 11
    }
}
