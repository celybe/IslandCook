//
//  VCHome.swift
//  IslandCook
//
//  Created by user211717 on 2/13/22.
//

import UIKit

class VCHome: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var filterEndPoint = ""
    
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 250
    }
    
    
    
    //------------------------ ClickListeners
    @IBAction func clickAll(_ sender: Any) {
        filterEndPoint = ""
        performSegue(withIdentifier: "fromHomeToAllList", sender: self)
    }
    @IBAction func clickPasta(_ sender: Any) {
        filterEndPoint = "/tag/Pasta"
        performSegue(withIdentifier: "fromHomeToAllList", sender: self)
    }
    @IBAction func clickDesssert(_ sender: Any) {
        filterEndPoint = "/tag/Dessert"
        performSegue(withIdentifier: "fromHomeToAllList", sender: self)
    }
    @IBAction func clickDinner(_ sender: Any) {
        filterEndPoint = "/tag/Dinner"
        performSegue(withIdentifier: "fromHomeToAllList", sender: self)
    }
    @IBAction func clickEasy(_ sender: Any) {
        filterEndPoint = "/difficulty/easy"
        performSegue(withIdentifier: "fromHomeToAllList", sender: self)
    }
    @IBAction func clickMedium(_ sender: Any) {
        filterEndPoint = "/difficulty/medium"
        performSegue(withIdentifier: "fromHomeToAllList", sender: self)
    }
    @IBAction func clickHigh(_ sender: Any) {
        filterEndPoint = "/difficulty/high"
        performSegue(withIdentifier: "fromHomeToAllList", sender: self)

    }
    //------------------------ Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromHomeToAllList"
        {
            let vistaDetalle = segue.destination as! TVCGetAllRecipes
            vistaDetalle.filterEndPoint = filterEndPoint
        }
    }
    
    
}
