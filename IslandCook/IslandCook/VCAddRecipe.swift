//
//  VCAddRecipe.swift
//  IslandCook
//
//  Created by Xavi Giron on 15/2/22.
//

import UIKit

class VCAddRecipe: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

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
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAuthor: UITextField!
    @IBOutlet weak var txtUrl_Image: UITextField!
}
