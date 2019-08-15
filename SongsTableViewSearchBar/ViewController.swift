//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

var music = Song.loveSongs


class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var personSearchResults: [Song] {
        get {
           
            guard let searchString = searchString else{
                return music
            }
            guard searchString != "" else {
                return music
            }
            if let scopeTitles = searchBar.scopeButtonTitles{
                let currentScopeIndex = searchBar.selectedScopeButtonIndex
                switch scopeTitles[currentScopeIndex]{
                    
                case "Name":
                    let results = music.filter{$0.name.lowercased().contains(searchString.lowercased())}
                    
                    if results.count == 0 {
                        messageLabel.text = "No results found"
                        return []
                    
                    }else {
                    messageLabel.text = ""
                    return music.filter{$0.name.lowercased().contains(searchString.lowercased())}
                    }
                
                case "Artist":
                    let results = music.filter{$0.artist.lowercased().contains(searchString.lowercased())}
                    
                    if results.count == 0 {
                        messageLabel.text = "No results found"
                        return []
                        
                    }else{
                        messageLabel.text = ""
                        return music.filter{$0.artist.lowercased().contains(searchString.lowercased())}
                    }
                default:
                    return music
                }
            }
            return music
        }
    }
    var searchString: String? = nil {
        didSet{
            print(searchString)
            self.songTableView.reloadData()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personSearchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ourCell", for: indexPath)
        let popSong = personSearchResults[indexPath.row]
        cell.textLabel?.text = popSong.name
        cell.detailTextLabel?.text = popSong.artist
        
        return cell
    }
    

    
    @IBOutlet weak var songTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       songTableView.dataSource = self
        searchBar.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}

extension ViewController: UISearchBarDelegate {
    internal func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchString = searchBar.text
        
}

}
