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
}

extension Recipe : Identifiable {

}
