//
//  VCAddRecipe2.swift
//  IslandCook
//
//  Created by Xavi Giron on 15/2/22.
//

import UIKit

class VCAddRecipe2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderQuantity.minimumValue = 0
        sliderQuantity.maximumValue = 10
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var txtIngredients: UITextField!
    @IBAction func btnAddIngredient(_ sender: Any) {
        var valor = sliderQuantity.value
        let intValor = Int(valor)
        let stringValor = String(intValor)
        lblValueSlider.text = stringValor
    }
    @IBOutlet weak var sliderQuantity: UISlider!
    @IBOutlet weak var lblValueSlider: UILabel!
    @IBOutlet weak var txtSteps: UITextField!
    @IBAction func btnAddSteps(_ sender: Any) {
    }
    @IBOutlet weak var txtTags: UITextField!
    @IBAction func btnAddTags(_ sender: Any) {
    }
}
