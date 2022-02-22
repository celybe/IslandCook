//
//  Recipe+CoreDataProperties.swift
//  IslandCook
//
//  Created by user211717 on 2/13/22.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var picture_url: String?
    @NSManaged public var difficulty: String?
    @NSManaged public var author: String?
    @NSManaged public var steps_recipe: Steps?
    @NSManaged public var ingredients_recipe: Ingredients?
    @NSManaged public var tags_recipe: Tags?

}

extension Recipe : Identifiable {

}
