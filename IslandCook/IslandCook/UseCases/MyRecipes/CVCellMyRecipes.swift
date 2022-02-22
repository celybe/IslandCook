//
//  CVCellMyRecipes.swift
//  IslandCook

import UIKit

class CVCellMyRecipes: UICollectionViewCell {

    
    
    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var nameRecipe: UILabel!
    
    func configure(with recipeName: String, recipeImage: String){
        self.nameRecipe.text = recipeName
        self.imageRecipe.load(urlString: recipeImage)
        self.imageRecipe.layer.cornerRadius = 11
    }

}
