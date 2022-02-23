//
//  ApiResponse.swift
//  IslandCook
//
//  Created by Xavi Giron on 14/2/22.
//

import Foundation
//Estructura a la cual son parseados los datos recibidos por la api
struct ApiResponse: Codable
{
    var _id: String
    var name: String
    
    struct ingredients: Codable
    {
        var name: String
        var amount: String
    }
    var ingredients: [ingredients]?
    var steps: [String]?
    var picture_url: String
    var difficulty: String?
    var author: String?
    var tags: [String]?
    
}
