//
//  ApiBody.swift
//  IslandCook
//
//  Created by user211717 on 2/17/22.
//

import Foundation
//Clase la cual es creada para enviar las recpuestas a la api
class ApiBody
{
    var name: String
    var ingredients = [[String:String]]()
    var steps: [String]
    var picture_url: String
    var difficulty: String
    var author: String
    var tags: [String]
    
    init(name: String, ingredients : [[String:String]], steps: [String], picture_url: String, difficulty: String,author: String, tags: [String]) {
        self.name = name
        self.ingredients = ingredients
        self.steps = steps
        self.picture_url = picture_url
        self.difficulty = difficulty
        self.author = author
        self.tags = tags
    }
    
}

class ingredients
{
    var name: String
    var amount: String
    init(name:String, amount: String) {
        self.name = name
        self.amount = amount
    }
}
