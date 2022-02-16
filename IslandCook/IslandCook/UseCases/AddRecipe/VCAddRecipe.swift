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
    var tags = [String]()
    var steps = [String]()
    var ingredients = [[String:String]]()
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
    
    private func pasaDatos()
    {
        myRecipe?.name = txtName.text!
        myRecipe?.author = txtAuthor.text!
        myRecipe?.picture_url = txtImage_Url.text!
        myRecipe?.difficulty = selectDifficulty!
        myRecipe?.tags = tags
        myRecipe?.steps = steps
//        myRecipe?.ingredients = ingredients
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        pasaDatos()
        APIService.shared.postRecipe()
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
        var dicciIngredients: [String:String] = ["Name": name, "Amount": amount]
        ingredients.append(dicciIngredients)
    }
    @IBAction func btnAddStep(_ sender: Any) {
        steps.append(txtSteps.text!)
    }
    @IBAction func btnAddTag(_ sender: Any) {
        tags.append(txtTags.text!)
    }
}
