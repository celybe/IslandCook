//
//  LauncherViewController.swift
//  ejercicio3
//
//  Created by Aracely Berrocal on 15/12/21.
//

import UIKit

class LauncherViewController: UIViewController, XMLParserDelegate {
    @IBOutlet weak var launcherImage: UIImageView!
    
    @IBOutlet weak var launcherButtonStart: UIButton!
    
    /**/
    var films = [Films]()
    var filmTitle = String()
    var filmGenre = String()
    var filmImageUrl = String()
    var nameElement = String()
    var genreArray : [String] = [String]();
    var newgenreArray : [String] = [String]();
    var parser: XMLParser = XMLParser()
    var dividido=""
    var ch = Character(",")
    let urlXML = "films.xml"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        launcherButtonStart.layer.cornerRadius=5
        
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
                genreArray += filmGenre.components(separatedBy: ",")
                
                var genreSet = Set<String>(genreArray)
                
                 newgenreArray = [String](genreSet);
        
                
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let MenuViewController = segue.destination as? MenuViewController else {return}
        
        MenuViewController.genreArray = self.newgenreArray
   
    }
}
