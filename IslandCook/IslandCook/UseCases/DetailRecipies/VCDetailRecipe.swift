//
//  VCDetailRecipe.swift
//  IslandCook
//
//  Created by Xavi Giron on 11/2/22.
//

import UIKit

class VCDetailRecipe: UIViewController {
    
    var miReceta: ApiResponse!
    var arraysDicci = [[String:String]]()
    var steps = [String]()

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
        
        update.myRecipe = miReceta
    }
    
    private func pasaReceta()-> ApiBody {
        
        let nameRecipe = lblNameRecipe.text!
        let author = lblAuthor.text!
        let picture_url = miReceta!.picture_url
        let difficulty = miReceta.difficulty!
        let recipeTags = miReceta.tags!
        for item in miReceta?.ingredients as! [ApiResponse.ingredients] {
            var name = item.name
            var amount = item.amount
            var diccionario = ["name": name, "amount": amount]
            arraysDicci.append(diccionario)
        }
        for item in miReceta.steps! {
            steps.append(item)
        }
        
        let myRecipe: ApiBody = ApiBody(name: nameRecipe, ingredients: arraysDicci, steps: steps, picture_url: picture_url, difficulty: difficulty, author: author, tags: recipeTags)
        return myRecipe
        
    }
    
    @IBOutlet weak var lblNameRecipe: UILabel!
    @IBOutlet weak var ivImageRecipe: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var tvIngredients: UITextView!
    @IBOutlet weak var tvSteps: UITextView!
    @IBAction func btnDelet5e(_ sender: Any) {
        let receta = pasaReceta()
        do
        {
            try APIService.shared.deleteRecipe(id: miReceta!._id, recipe: receta)
        }
        catch
        {
            let error = error as NSError
            print("Error al eliminar, \(error)")
        }
    }
    
}
