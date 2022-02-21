//
//  VCFavorites.swift
//  IslandCook
//
//  Created by user209640 on 2/14/22.
//

import UIKit

class VCFavorites: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource   {
    
    let myRecipesExamples : [String] = ["https://cdn.vox-cdn.com/thumbor/DQneqacgrmet47pxQDwvDqhBYSI=/0x0:900x1125/920x613/filters:focal(478x728:622x872):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/68862911/La_Comida_tacos.0.jpg%22,%22https://cdn.vox-cdn.com/thumbor/r6lodJrk_CHIO101QRLWwwAJ_EM=/0x0:1600x800/920x613/filters:focal(672x272:928x528):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/63656524/Comida.0.png%22,%22https://cdn.aarp.net/content/dam/aarp/health/caregiving/2018/03/1140-nutrients-food-loved-ones-caregiving-esp.imgcache.rev.web.700.403.jpg"]

    let myRecipesLabels : [String] = ["Receta 1","Receta 2","Receta 3"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myRecipesExamples.count<#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        if let recipeCell = dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CVCellFavorites {
            recipeCell.configure(recipeLabel: myRecipesLabels[indexPath.row], recipeImage: myRecipesExamples[indexPath.row])
        }
        return cell
    }
    

    @IBOutlet weak var collectionView: CVFavorites!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
