//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    let songs = Song.loveSongs
    var filteredSongs: [Song] {
        guard let userSearchTerm = userSearchTerm else {
            return songs
        }
        
        if let scopeArrTitles = searchBar.scopeButtonTitles {
            let currentIndex = searchBar.selectedScopeButtonIndex
            let selectedStr = scopeArrTitles[currentIndex]
            switch selectedStr {
            case "Artist":
                return userSearchTerm == "" ? songs : songs.filter{ $0.artist.lowercased().contains(userSearchTerm.lowercased())}
            case "Song":
                return userSearchTerm == "" ? songs : songs.filter{ $0.name.lowercased().contains(userSearchTerm.lowercased())}
            default:
                return songs
            }
        } else {
            return songs
        }
    }
    
    var userSearchTerm: String? = nil {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.song = filteredSongs[tableView.indexPathForSelectedRow!.row]
        }
    }
    
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSongs.count != 0 ? filteredSongs.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if filteredSongs.count > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Love Song Cell", for: indexPath)
            
            cell.textLabel?.text = filteredSongs[indexPath.row].name
            cell.detailTextLabel?.text = filteredSongs[indexPath.row].artist
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Love Song Cell", for: indexPath)
            cell.textLabel?.text = "No search results found."
            cell.detailTextLabel?.text = nil
            return cell
        }
    }
    
    
}

extension TableViewController: UITableViewDelegate {}

extension TableViewController: UISearchBarDelegate {
    //    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    //        print("Button clicked!")
    //        userSearchTerm = searchBar.text
    //        print(userSearchTerm)
    //        print(userSearchTerm != nil ? "userSearchTerm exists" : "userSearchTermDoesNOTExist")
    //    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print("Button clicked!")
        userSearchTerm = searchBar.text
        print(userSearchTerm)
        print(userSearchTerm != nil ? "userSearchTerm exists" : "userSearchTermDoesNOTExist")
        print(filteredSongs.count)
        
        if filteredSongs.count == 0 {
            searchBar.endEditing(true)
        }
    }
}
