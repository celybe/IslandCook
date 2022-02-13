//
//  Tags+CoreDataProperties.swift
//  IslandCook
//
//  Created by user211717 on 2/13/22.
//
//

import Foundation
import CoreData


extension Tags {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tags> {
        return NSFetchRequest<Tags>(entityName: "Tags")
    }

    @NSManaged public var tags: String?
    @NSManaged public var recipe_tags: Recipe?

}

extension Tags : Identifiable {

}
