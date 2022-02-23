//
//  VCHome.swift
//  IslandCook
//
//  Created by user211717 on 2/13/22.
//

import UIKit

class VCHome: UIViewController, UITableViewDelegate, UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
    private var filterEndPoint = "/"
    private var nextWindowTitle = "All"
    private var decodeData: ApiResponse?
    //Llama al singelton de llamadas a la api y recoge duna lista de todas las recetas
    private var recipesList : [ApiResponse] = APIService.shared.decodeJson(endpoint: "/")
    @IBOutlet weak var stackLblsDifficultity: UIStackView!
    @IBOutlet weak var stackLblsTags: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipesList.shuffle()
    }
    
    //Hace el autolayout dependiendo de si está rotada ala pantalla o no
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        let orientation = UIDevice.current.orientation
        if orientation.isLandscape
        {
            asignLandScapeLayout()
        }else{
            asignVerticalLayout()
        }
    }
    
    //------------------------ Autolayout
    //AutoLayout horizontal
    func asignLandScapeLayout(){
        stackLblsTags.spacing = 50
        stackLblsDifficultity.spacing = 50
    }
    //AutoLayout vertical
    func asignVerticalLayout(){
        stackLblsTags.spacing = 10
        stackLblsDifficultity.spacing = 10
    }


    //------------------------ TableView
    //Retorna el numero de secciones en la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    //Asigna el tipo de celda, en este caso la que contiene la collection view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "homeTopRecipesCell", for: indexPath) as? TVCHomeRow else { fatalError()}
        return cell
    }
    //Asigna el alto de la línea
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 250
    }
    
    
    //------------------------ ClickListeners de los botones superiores
    //Pasa a la pantalla de la lista de recetassin aplicar un filtro y ejecuta el segue
    @IBAction func clickAll(_ sender: Any) {
        filterEndPoint = ""
        performSegue(withIdentifier: "fromHomeToAllList", sender: self)
    }
    //Pasa a la pantalla de la lista de recetassin aplicar un filtro y ejecuta el segue
    @IBAction func clickPasta(_ sender: Any) {
        nextWindowTitle = "Pasta"
        filterEndPoint = "/tag/Pasta"
        performSegue(withIdentifier: "fromHomeToAllList", sender: self)
    }
    //Pasa a la pantalla de la lista de recetas aplicando un filtro por tag y ejecuta el segue
    @IBAction func clickDesssert(_ sender: Any) {
        nextWindowTitle = "Dessert"
        filterEndPoint = "/tag/Dessert"
        performSegue(withIdentifier: "fromHomeToAllList", sender: self)
    }
    //Pasa a la pantalla de la lista de recetas aplicando un filtro por tag y ejecuta el segue
    @IBAction func clickDinner(_ sender: Any) {
        nextWindowTitle = "Dinner"
        filterEndPoint = "/tag/Dinner"
        performSegue(withIdentifier: "fromHomeToAllList", sender: self)
    }
    //Pasa a la pantalla de la lista de recetas aplicando un filtro por dificultad y ejecuta el segue
    @IBAction func clickEasy(_ sender: Any) {
        nextWindowTitle = "Easy"
        filterEndPoint = "/difficulty/easy"
        performSegue(withIdentifier: "fromHomeToAllList", sender: self)
    }
    //Pasa a la pantalla de la lista de recetas aplicando un filtro por dificultad y ejecuta el segue
    @IBAction func clickMedium(_ sender: Any) {
        nextWindowTitle = "Medium"
        filterEndPoint = "/difficulty/medium"
        performSegue(withIdentifier: "fromHomeToAllList", sender: self)
    }
    //Pasa a la pantalla de la lista de recetas aplicando un filtro por dificultad y ejecuta el segue
    @IBAction func clickHigh(_ sender: Any) {
        nextWindowTitle = "High"
        filterEndPoint = "/difficulty/high"
        performSegue(withIdentifier: "fromHomeToAllList", sender: self)

    }
    //------------------------ Navigation
    //Función que navega al detalle o a la vista de la lista
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromHomeToAllList"
        {
            let vistaDetalle = segue.destination as! VCList
            vistaDetalle.filterEndPoint = filterEndPoint
            vistaDetalle.windowTitle = nextWindowTitle
        }
        
        if segue.identifier == "homeToDetail"
        {
            let vistaDetalle = segue.destination as! VCDetailRecipe
            vistaDetalle.miReceta = decodeData
        }
    }
    
    
    //------------------------ Funciones colección
    //Configura la collection View
    func collectionView(_ collectionView:UICollectionView,layout UICollectionViewLayout: UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath)-> CGSize{
        return CGSize(width: UIScreen.main.bounds.width, height: 250)
    }
    //Retorna el número de items a cargar en la collection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(recipesList.count<20){
            return recipesList.count
        }
        return 20
    }
    //Cuando un elemento de la colección es seleccionado ejecuta el segue al detalle
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        decodeData  = recipesList[indexPath.row]
         performSegue(withIdentifier: "homeToDetail", sender: self)
    }
    //Funcion que asigna las propiedades a las celdas
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellTopRecipes", for: indexPath) as! CVCHome
        cell.txtTitle.text = recipesList[indexPath.row].name
        cell.ivRecipe.downloaded(from: recipesList[indexPath.row].picture_url )
        cell.ivRecipe.layer.cornerRadius = 15
        cell.ivRecipe.frame.size.width = 160
        cell.ivRecipe.frame.size.height = 160
        cell.ivRecipe.contentMode = UIView.ContentMode.scaleAspectFill
        return cell
    }
    
}
