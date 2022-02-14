//
//  Steps+CoreDataProperties.swift
//  IslandCook
//
//  Created by user211717 on 2/13/22.
//
//

import Foundation
import CoreData


extension Steps {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Steps> {
        return NSFetchRequest<Steps>(entityName: "Steps")
    }

    @NSManaged public var step: String?
    @NSManaged public var recipe_steps: Recipe?

}

extension Steps : Identifiable {

}
