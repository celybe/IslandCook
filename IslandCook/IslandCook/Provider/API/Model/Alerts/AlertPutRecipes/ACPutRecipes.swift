//
//  ACPutRecipes.swift
//  IslandCook
//
//  Created by Xavi Giron on 17/2/22.
//

import UIKit

class ACPutRecipes: UIAlertController {
    var msgError = "Whoopss, something didn't came out the way it was supposed to"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "Put error", message: msgError, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }

}
