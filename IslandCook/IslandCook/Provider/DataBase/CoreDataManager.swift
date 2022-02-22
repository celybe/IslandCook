//
//  CoreDataManager.swift
//  IslandCook
//
//  Created by user211717 on 2/13/22.
//

import Foundation
import CoreData

class CoreDataManager{
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RecipeModel")
        container.loadPersistentStores{
            storeDescription,
            error in guard let error = error else {return}
        }
        return container
    }()
    
    func saveContext(id: String, author: String, difficulty: String,  ingredients: String, name: String, picture_url: String, steps: Steps, ingredients_recipe: Ingredients, tags_recipe: Tags){
        let context = persistentContainer.viewContext
        if context.hasChanges{
            do{
                let recipe = NSEntityDescription.insertNewObject(forEntityName: "Recipe", into: context) as! Recipe
                recipe.id = id
                recipe.author=author
                recipe.difficulty = difficulty
                recipe.picture_url = picture_url
                recipe.ingredients_recipe = ingredients_recipe
                recipe.name = name
                recipe.steps_recipe = steps
                recipe.tags_recipe = tags_recipe
                try context.save()
            }catch{
                print("Save in database failed,\(error as NSError)")
            }
        }
    }
    
    func getRecipes()-> [Recipe]?{
        let context = persistentContainer.viewContext
        var recipesList: [Recipe] = []
        do{
            try recipesList = context.fetch(Recipe.fetchRequest())
        }catch{
            print("Save in database failed,\(error as NSError)")
        }
        return recipesList
    }
    
    func deleteRecipe(recipe: Recipe)-> Bool {
        let context = persistentContainer.viewContext
        do{
            context.delete(recipe)
        }catch{
            print("Save in database failed,\(error as NSError)")
            return false
        }
        return true
    }
    
    //Singelton
    static let shared: CoreDataManager = {
        let instance = CoreDataManager()
        return instance
    }()
}
