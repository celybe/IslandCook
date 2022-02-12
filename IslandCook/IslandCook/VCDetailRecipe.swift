//
//  VCDetailRecipe.swift
//  IslandCook
//
//  Created by Xavi Giron on 11/2/22.
//

import UIKit

class VCDetailRecipe: UIViewController {
    
    var decodeData: [DatosDetalle] = []
    var id: String?
    var nombre: String?
    var image_url: String?
    var author: String?
    var ingredients: [DatosDetalle.ingredients]?
    var steps: [String]?
    var difficulty: String?
    var tags: [String]?
    var imageUrl: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        loadRecipe()
    }

    
    
    func loadRecipe()
    {
        let stringSteps = steps?.joined(separator: ",")
//        let stringIngredients = ingredients
        
        lblNameRecipe.text = nombre
        lblAuthor.text = author
//        tvIngredients.text = stringIngredients
        tvSteps.text = stringSteps
        ivImageRecipe.downloaded2(from: imageUrl!)
        
        
    }
    
    
    
    
    
    
    @IBOutlet weak var lblNameRecipe: UILabel!
    @IBOutlet weak var ivImageRecipe: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var tvIngredients: UITextView!
    @IBOutlet weak var tvSteps: UITextView!
}

extension UIImageView {
    
//    función de descarga de la imagen de receta
    func downloaded2(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded2(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


