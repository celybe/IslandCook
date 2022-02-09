//
//  TableViewController.swift
//  ejercicio3
//
//  Created by Aracely Berrocal on 15/12/21.
//

import UIKit

class TableViewController: UITableViewController, XMLParserDelegate {

    /**/
    var films = [Films]()
    var filmTitle = String()
    var filmGenre = String()
    var filmImageUrl = String()
    var nameElement = String()
    var genre = Set<String>()
    var parser: XMLParser = XMLParser()
    var dividido=""
    var ch = Character(",")
    let urlXML = "films.xml"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
            if let path = Bundle.main.url(forResource: "films", withExtension: "xml"){
                if let parser = XMLParser(contentsOf: path){
                    parser.delegate = self
                    parser.parse()
                }
            }
    }
    //------------------------------------------------PARSER---------------------------------------
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        nameElement=elementName
        if nameElement == "row" {
            
            filmTitle = String()
            filmGenre = String()
            filmImageUrl = String()
        }
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if !data.isEmpty {
            if nameElement == "Title" {
                filmTitle += data
            }else if nameElement == "Genre" {
                filmGenre += data
                print(filmGenre)
                genre.insert(filmGenre);
                
            }else if nameElement == "Images" {
                filmImageUrl += data
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "row" {
            let dataFilms = Films(title: filmTitle, genre: [filmGenre], imageUrl:filmImageUrl )
            print(filmImageUrl)
            films.append(dataFilms)
        }
    }
    
    //------------------------------------------------TABLE---------------------------------------

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return films.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        let titleFilm = films[indexPath.row].title
        cell.textLabel?.text = titleFilm

        let genreFilm = films[indexPath.row].genre
        cell.detailTextLabel?.text = genreFilm.joined(separator: " ")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailFilm", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailFilm" {
            guard let CeldSelected = tableView.indexPathForSelectedRow?.row else {return}
            let filmSelected = films[CeldSelected]
            let detailView = segue.destination as! DetailViewController
            detailView.filmUrlImage = filmSelected.imageUrl
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
