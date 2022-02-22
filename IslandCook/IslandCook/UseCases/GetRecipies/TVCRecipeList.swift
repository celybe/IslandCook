//
//  TVCRecipeList.swift
//  IslandCook
//
//  Created by user211717 on 2/22/22.
//

import UIKit

class TVCRecipeList: UITableViewCell {

    @IBOutlet weak var lblRecipeListAuthor: UILabel!
    
    @IBOutlet weak var ivRecipeList: UIImageView!
    @IBOutlet weak var lblRecipeName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
