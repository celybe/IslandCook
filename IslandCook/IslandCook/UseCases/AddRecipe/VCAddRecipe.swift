//
//  VCAddRecipe.swift
//  IslandCook
//
//  Created by Xavi Giron on 15/2/22.
//

import UIKit

class VCAddRecipe: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var myRecipe: ApiResponse?
    var dicciIngredients: [String:String] = [:]
    var getApi: [ApiResponse] = []
    var tags: [String] = []
    var steps: [String] = []
    private var myIngredients = [[String:String]]()
    var pickedDifficulty: Int = 55
    var difficulties = ["Easy", "Medium", "Show off"]
    var selectDifficulty: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return difficulties.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("has seleccionado \(difficulties[row])")
        return difficulties[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectDifficulty = difficulties[row]
        
    }
    
    private func pasaDatos()-> ApiBody
    {
        let nameRecipe = txtName.text!
        let author = txtAuthor.text!
        let picture_url = txtImage_Url.text!
        let difficulty = selectDifficulty!
        let recipeTags = tags
        let recipeSteps = steps
        
        let recipeIngredients: [Ingredients] = myIngredients as! [Ingredients]
        let myRecipe: ApiBody = ApiBody(name: nameRecipe, ingredients: recipeIngredients, steps: recipeSteps, picture_url: picture_url, difficulty: difficulty, author: author, tags: recipeTags)
        return myRecipe
    }
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAuthor: UITextField!
    @IBOutlet weak var txtImage_Url: UITextField!
    @IBOutlet weak var txtIngredients: UITextField!
    
    @IBOutlet weak var txtQuantityIngredients: UITextField!
    @IBOutlet weak var txtSteps: UITextField!
    @IBOutlet weak var txtTags: UITextField!
    @IBAction func btnAddIngredient(_ sender: Any) {
        guard let name = txtIngredients.text, let amount = txtQuantityIngredients.text else
            {return}
        dicciIngredients = ["Name": name, "Amount": amount]
        myIngredients.append(dicciIngredients)
        txtIngredients.text = ""
        txtQuantityIngredients.text = ""
    }
    @IBAction func btnAddStep(_ sender: Any) {
        steps.append(txtSteps.text!)
        txtSteps.text = ""
    }
    @IBAction func btnAddTag(_ sender: Any) {
        tags.append(txtTags.text!)
        txtTags.text = ""
    }
    
    @IBAction func btnSave(_ sender: Any) {
        let receta = pasaDatos()
        APIService.shared.postRecipe(recipe: receta )
    }
    
}
