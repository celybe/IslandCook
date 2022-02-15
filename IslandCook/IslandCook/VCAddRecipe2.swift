//
//  VCAddRecipe2.swift
//  IslandCook
//
//  Created by Xavi Giron on 15/2/22.
//

import UIKit

class VCAddRecipe2: UIViewController {
    
    var nombreReceta: String?
    var author: String?
    var urlImage: String?
    var ingredientes = [String]()
    var steps = [String]()
    var tags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderQuantity.minimumValue = 0
        sliderQuantity.maximumValue = 10
        // Do any additional setup after loading the view.
    }
    
    private func postNewRecipe()
    {
        APIService.shared.postRecipe()
    }
    
    @IBOutlet weak var txtIngredients: UITextField!
    @IBAction func btnAddIngredient(_ sender: Any) {
        var valor = sliderQuantity.value
        let intValor = Int(valor)
        let stringValor = String(intValor)
        lblValueSlider.text = stringValor
        if txtIngredients != nil
        {
            ingredientes.append(txtIngredients.text!)
        }
        else
        {
            print("introduce ingredientes para agregarlos a tu receta")
        }
    }
    @IBOutlet weak var sliderQuantity: UISlider!
    @IBOutlet weak var lblValueSlider: UILabel!
    @IBOutlet weak var txtSteps: UITextField!
    @IBAction func btnAddSteps(_ sender: Any) {
        if txtSteps != nil
        {
            steps.append(txtSteps.text!)
        }
        else
        {
            print("introduce pasos para agregarlos a tu receta")
        }
    }
    @IBOutlet weak var txtTags: UITextField!
    @IBAction func btnAddTags(_ sender: Any) {
        if txtTags != nil
        {
            tags.append(txtTags.text!)
        }
        else
        {
            print("introduce tags para agregarlos a tu receta")
        }
        do
        {
//            try 
        }
        catch let error as NSError
        {
            print("La cagaste burlancaster: \(error)")
        }
    }
    
    
}
