//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var songTable: UITableView!
    
    let allSongs = Song.loveSongs
    
    var searchResults:[Song] {
        get {
            //when we have no search term, return the value of the initial set of people
            guard let searchString = searchString else {
                return allSongs
            }
            guard searchString != ""  else {
                return allSongs
            }
            if let scopeTitles = searchBar.scopeButtonTitles {
                let currentScopeIndex = searchBar.selectedScopeButtonIndex
                switch scopeTitles[currentScopeIndex] {
                case "Songs":
                    return allSongs.filter{$0.name.lowercased().contains(searchString.lowercased())}
                case "Artists":
                    return allSongs.filter{$0.artist.lowercased().contains(searchString.lowercased())}
                default:
                    return allSongs
                }
            }
            return allSongs
        }
    }
    
    var searchString: String? = nil {
        didSet {
//            print(searchString)
            self.songTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songTable.delegate = self
        songTable.dataSource = self
        searchBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songListCell", for: indexPath)
        
        cell.textLabel?.text = searchResults[indexPath.row].name
        
        cell.detailTextLabel?.text = searchResults[indexPath.row].artist
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
}
