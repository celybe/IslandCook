//
//  VCAddRecipe.swift
//  IslandCook
//
//  Created by Xavi Giron on 15/2/22.
//

import UIKit

class VCAddRecipe: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var myRecipe: ApiResponse?
    var getApi: [ApiResponse] = []
    var tags: [String] = []
    var steps: [String] = []
    var ingredients = [[String:String]]()
    var pickedDifficulty: Int = 55
    var difficulties = ["Easy", "Medium", "Show off"]
    var selectDifficulty: String?
    @IBOutlet weak var lblIngredients: UILabel!
    @IBOutlet weak var lblTags: UILabel!
    @IBOutlet weak var lblStep: UILabel!
    
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
        let nameRecipe = "Pan con mantequilla y azucar"
        let author = "Lisa"
        let picture_url = "https://www.afuegolento.com/img_db/timthumb.php?src=img_db/interviews/2020/05/interview-5ec66c8b8cb26.jpg"
        let difficulty = "Easy"
        let recipeTags = ["Bread","Sweet"]
        let recipeSteps = ["Spread that butter, bitch"]
        let recipeIngredients: [Ingredients] = []
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
        let dicciIngredients: [String:String] = ["Name": name, "Amount": amount]
        ingredients.append(dicciIngredients)
        addIngredientToLbl()
    }
    @IBAction func btnAddStep(_ sender: Any) {
        steps.append(txtSteps.text!)
        addStepToLbl()
    }
    @IBAction func btnAddTag(_ sender: Any) {
        tags.append(txtTags.text!)
        addTagsToLbl()
    }
    
    @IBAction func btnSave(_ sender: Any) {
        let receta = pasaDatos()
        APIService.shared.postRecipe(recipe: receta )
    }
    private func addIngredientToLbl(){
        var tagsString : String = ""
        for item in ingredients{
            tagsString += "\(item["Name"]!) "
        }
        lblIngredients.text = tagsString
    }
    private func addStepToLbl(){
        var stepsString : String = ""
        for item in steps{
            stepsString += "- \(item) \n"
        }
        lblStep.text = stepsString
    }
    private func addTagsToLbl(){
        var tagsString : String = ""
        for item in tags{
            tagsString += "\(item) "
        }
        lblTags.text = tagsString
    }
    
}
