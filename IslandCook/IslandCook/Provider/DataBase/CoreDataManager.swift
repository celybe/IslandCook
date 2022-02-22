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
    
    func saveContext(id: String, author: String, difficulty: String, name: String, picture_url: String){
        let context = persistentContainer.viewContext
        var recipe: NSObject = Recipe(context: context)
        recipe.setValue(id, forKey: "id")
        recipe.setValue(name, forKey: "name")
        recipe.setValue(author, forKey: "author")
        recipe.setValue(difficulty, forKey: "difficulty")
        recipe.setValue(picture_url, forKey: "picture_url")
        print("Hola desde core")
        
            do{
                print("Hola desde core")
                try context.save()
            }catch{
                print("Save in database failed,\(error as NSError)")
            
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
