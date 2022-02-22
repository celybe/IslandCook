//
//  ViewController.swift
//  IslandCook
//
//  Created by user209640 on 2/21/22.
//

import UIKit

class VCMyRecipes: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource{
 

    @IBOutlet weak var collection: UICollectionView!
    var myRecipesExamples = CoreDataManager.shared.getRecipes()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        myRecipesExamples = CoreDataManager.shared.getRecipes()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myRecipesExamples!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let recipeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellMyRecipe", for: indexPath) as? CVCellMyRecipes {
            recipeCell.configure(with: myRecipesExamples![indexPath.row].name, recipeImage: myRecipesExamples![indexPath.row].picture_url)
            cell = recipeCell
        }
        return cell
    }
    override func viewDidAppear(_ animated: Bool) {
        myRecipesExamples = CoreDataManager.shared.getRecipes()
        print(myRecipesExamples)
    }
    override func viewWillAppear(_ animated: Bool) {
        myRecipesExamples = CoreDataManager.shared.getRecipes()
        collection.reloadData()
    
    }

}
