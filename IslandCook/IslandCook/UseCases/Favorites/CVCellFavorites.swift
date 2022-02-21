//
//  CVCellFavorites.swift
//  IslandCook
//
//  Created by Aracely Berrocal on 21/2/22.
//

import UIKit

class CVCellFavorites: UICollectionViewCell {
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeLabel: UILabel!
    
    func configure(recipeLabel: String, recipeImage: String){
        self.recipeLabel.text = recipeLabel
        self.recipeImage.downloaded(from: recipeImage)
        self.recipeImage.layer.cornerRadius = 11
    }
}
