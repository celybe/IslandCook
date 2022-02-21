//
//  CVCellMyRecipes.swift
//  IslandCook
//
<<<<<<< HEAD
//  Created by Aracely on 16/2/22.
=======
//  Created by user209640 on 2/21/22.
>>>>>>> cely2.0
//

import UIKit

class CVCellMyRecipes: UICollectionViewCell {
<<<<<<< HEAD
    @IBOutlet weak var lblNameRecipe: UILabel!
    @IBOutlet weak var imageRecipe: UIImageView!
    
    func configure(with recipeName:String, recipeImage: String){
        
        self.lblNameRecipe.text = recipeName
        self.imageRecipe.load(urlString: recipeImage)
        self.imageRecipe.layer.cornerRadius = 11
    }
=======
    
    
    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var nameRecipe: UILabel!
    
    func configure(with recipeName: String, recipeImage: String){
        self.nameRecipe.text = recipeName
        self.imageRecipe.load(urlString: recipeImage)
        self.imageRecipe.layer.cornerRadius = 11
    }
 
>>>>>>> cely2.0
}
