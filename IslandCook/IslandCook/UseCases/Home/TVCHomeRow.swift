//
//  TVCHomeRow.swift
//  IslandCook
//
//  Created by user211717 on 2/13/22.
//

import UIKit

class TVCHomeRow: UITableViewCell {
    
    private var recipesList : [ApiResponse] = APIService.shared.decodeJson(endpoint: "")
    private var recipeId: String = ""
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization
        recipesList.shuffle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView:UICollectionView,layout UICollectionViewLayout: UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath)-> CGSize{
        return CGSize(width: 190, height: 250)
    }
}
