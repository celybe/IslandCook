//
//  Ingredients+CoreDataProperties.swift
//  IslandCook
//
//  Created by user211717 on 2/13/22.
//
//

import Foundation
import CoreData


extension Ingredients {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredients> {
        return NSFetchRequest<Ingredients>(entityName: "Ingredients")
    }

    @NSManaged public var amount: String?
    @NSManaged public var name: String?
    @NSManaged public var recipe_ingredients: Recipe?

}

extension Ingredients : Identifiable {

}
