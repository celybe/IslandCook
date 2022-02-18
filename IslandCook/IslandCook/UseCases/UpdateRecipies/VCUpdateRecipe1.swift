//
//  VCUpdateRecipe1.swift
//  IslandCook
//
//  Created by Xavi Giron on 13/2/22.
//

import UIKit

class VCUpdateRecipe1: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var myRecipe: ApiResponse?
    var getApi: [ApiResponse] = []
    var pickedDifficulty: Int = 55
    var difficulties = ["Easy", "Medium", "Show off"]
    var selectDifficulty: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargareceta()
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
    
    private func cargareceta()
    {
        let stringTags = myRecipe?.tags.joined(separator: ".")
        
        

        txtRecipeName.text = myRecipe?.name
        txtAuthor.text = myRecipe?.author
        txtImageUrl.text = myRecipe?.picture_url
        txtIngredients.text = myRecipe?.ingredients.description
        txtSteps.text = myRecipe?.steps.description
        txtTags.text = stringTags
    }
    @IBAction func btnSaveUpdate(_ sender: Any) {
        APIService.shared.putRecipe(id: myRecipe!._id)
    }
    
    @IBOutlet weak var txtImageUrl: UITextField!
    @IBOutlet weak var txtAuthor: UITextField!
    @IBOutlet weak var txtRecipeName: UITextField!
    @IBOutlet weak var txtIngredients: UITextField!
    @IBOutlet weak var txtSteps: UITextField!
    @IBOutlet weak var txtTags: UITextField!
}
