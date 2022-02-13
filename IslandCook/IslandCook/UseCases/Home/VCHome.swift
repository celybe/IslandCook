//
//  VCHome.swift
//  IslandCook
//
//  Created by user211717 on 2/13/22.
//

import UIKit

class VCHome: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var recipesList : [DatosDetalle] = APIService.shared.decodeJson()
    @IBOutlet weak var tableViewTopRecipes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //------------------------ TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "homeTopRecipesCell", for: indexPath) as? TVCHomeRow else { fatalError()}
        return cell
    }
 
    
   

   
    //------------------------ ClickListeners
    @IBAction func clickAll(_ sender: Any) {
    }
    @IBAction func clickPasta(_ sender: Any) {
    }
    @IBAction func clickDesssert(_ sender: Any) {
    }
    @IBAction func clickDinner(_ sender: Any) {
    }
    @IBAction func clickEasy(_ sender: Any) {
    }
    @IBAction func clickMedium(_ sender: Any) {
    }
    @IBAction func clickHigh(_ sender: Any) {
    }
    
}
