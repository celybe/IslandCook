//
//  extensions.swift
//  ejercicio3
//
//  Created by Aracely Berrocal on 15/12/21.
//

import Foundation
import UIKit

extension UIImageView{
    func load(url : String){
        guard let url = URL(string: url)else{
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                   
                }
            }
        }
    }
}
