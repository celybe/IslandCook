//
//  VCDetailRecipe.swift
//  IslandCook
//
//  Created by Xavi Giron on 11/2/22.
//

import UIKit

class VCDetailRecipe: UIViewController {
    
    var decodeData: [ApiResponse] = []
    var id: String?
    var nombre: String?
    var image_url: String?
    var author: String?
    var ingredients: [ApiResponse.ingredients]?
    var steps: [String]?
    var difficulty: String?
    var tags: [String]?
    var imageUrl: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        loadRecipe()
    }
    
    
    func loadRecipe()
    {
        let stringSteps = steps?.joined(separator: ".")
        
        let stringIngredientes = ingredients?.description
        
        lblNameRecipe.text = nombre
        lblAuthor.text = author
        tvIngredients.text = stringIngredientes?.localizedCapitalized
        tvSteps.text = stringSteps
        ivImageRecipe.downloaded(from: imageUrl!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let update = segue.destination as! VCUpdateRecipe1
        
        update.myId = id
    }
    
    @IBOutlet weak var lblNameRecipe: UILabel!
    @IBOutlet weak var ivImageRecipe: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var tvIngredients: UITextView!
    @IBOutlet weak var tvSteps: UITextView!
}
