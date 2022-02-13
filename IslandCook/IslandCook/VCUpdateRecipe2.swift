//
//  VCUpdateRecipe2.swift
//  IslandCook
//
//  Created by Xavi Giron on 13/2/22.
//

import UIKit

class VCUpdateRecipe2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderQuantity.minimumValue = 0
        sliderQuantity.maximumValue = 10

        // Do any additional setup after loading the view.
    }
    
//    override func loadView() {
//        var valorSlider = sliderQuantity.value
//        let stringValue = String(valorSlider)
//        
//        lblValueSlider.text = stringValue
//    }
    
    @IBOutlet weak var txtIngredients: UITextField!
    
    @IBOutlet weak var sliderQuantity: UISlider!
    
    @IBOutlet weak var lblValueSlider: UILabel!
    @IBAction func btnAddIngredient(_ sender: Any) {
        print(sliderQuantity.value)
    }
    @IBOutlet weak var txtSteps: UITextField!
    @IBAction func btnAddSteps(_ sender: Any) {
    }
    
    @IBOutlet weak var txtTags: UITextField!
    @IBAction func btnAddTags(_ sender: Any) {
    }
    
    
    
}
