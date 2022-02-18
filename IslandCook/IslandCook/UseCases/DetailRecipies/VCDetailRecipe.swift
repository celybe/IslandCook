//
//  VCDetailRecipe.swift
//  IslandCook
//
//  Created by Xavi Giron on 11/2/22.
//

import UIKit

class VCDetailRecipe: UIViewController {
    
    var miReceta: ApiResponse!

    override func viewDidLoad() {
        super.viewDidLoad()

        loadRecipe()
    }
    
    
    func loadRecipe()
    {
        let stringSteps = miReceta?.steps?.joined(separator: ".")
        lblNameRecipe.text = miReceta?.name
        lblAuthor.text = miReceta?.author
        tvIngredients.text = ""
        for item in miReceta.ingredients! {
            tvIngredients.text += "- \(item.name) \(item.amount)\n"
        }
        tvSteps.text = ""
        for item in miReceta.steps! {
            tvSteps.text += "- \(item)\n\n"
        }
        ivImageRecipe.layer.cornerRadius = 15
        ivImageRecipe.downloaded(from: miReceta!.picture_url)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let update = segue.destination as! VCUpdateRecipe1
        
//        update.myId = id
        update.myRecipe = miReceta
    }
    
    @IBOutlet weak var lblNameRecipe: UILabel!
    @IBOutlet weak var ivImageRecipe: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var tvIngredients: UITextView!
    @IBOutlet weak var tvSteps: UITextView!
    @IBAction func btnDelet5e(_ sender: Any) {
        APIService.shared.deleteRecipe(id: miReceta!._id)
    }
    
}
