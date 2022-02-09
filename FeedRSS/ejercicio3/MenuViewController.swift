//
//  MenuViewController.swift
//  ejercicio3
//
//  Created by Aracely Berrocal on 17/12/21.
//

import UIKit

class MenuViewController: UIViewController, XMLParserDelegate, UIPickerViewDelegate, UIPickerViewDataSource{

    
    
  

    @IBOutlet weak var ButtomDone: UIButton!
    
    @IBOutlet weak var username: UITextField!
    
   
    @IBOutlet weak var pickerGenre: UIPickerView!
    
    
    var films = [Films]()
    var users = Set<String>()
    
    var filmTitle = String()
    let defaults = UserDefaults.standard
    var genreArray: [String] = [String]();
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.pickerGenre.delegate = self
        self.pickerGenre.dataSource = self

    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genreArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genreArray[row]
    }
    

}
