//
//  SongViewController.swift
//  SongsTableViewSearchBar
//
//  Created by EricM on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var message: UILabel!
    
    
    
    var music = Song.loveSongs
    var personSearchResults: [Song] {
        get {
            // when we habe no search term, return the value of the initial set of people
            guard let searchString = searchString else{
                return music
            }
            guard searchString != "" else {
                
                return music
            }
            if let scopTitles = search.scopeButtonTitles{
                let currentScopeIndex = search.selectedScopeButtonIndex
                switch scopTitles[currentScopeIndex]{
                    
                case "SongName":
                    let results =  music.filter{$0.name.lowercased().contains(searchString.lowercased())}
                    if results.count == 0 {
                        message.text = "No results found"
                        search.resignFirstResponder()
                        return []
                    } else {
                        message.text = ""
                    return music.filter{$0.name.lowercased().contains(searchString.lowercased())}
                    }
                
                case "Artist":
                    let results =  music.filter{$0.name.lowercased().contains(searchString.lowercased())}
                    if results.count == 0 {
                        message.text = "No results found"
                        search.resignFirstResponder()
                        return []
                    } else {
                        message.text = ""
                        return music.filter{$0.name.lowercased().contains(searchString.lowercased())}
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
            self.tableView.reloadData()
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        message.text = ""
        tableView.dataSource = self
        search.delegate = self
        // Do any additional setup after loading the view.
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

extension SongViewController: UISearchBarDelegate{
    internal func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchString = searchBar.text
        
    }
}
