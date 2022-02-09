//
//  DetailViewController.swift
//  ejercicio3
//
//  Created by Aracely Berrocal on 15/12/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var filmImage: UIImageView!
    
    var filmUrlImage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmImage.load(url: filmUrlImage)
        // Do any additional setup after loading the view.
        
    }
    
    
}

