//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

   var allSongs = [Song]()
    var searchTerm: String? {
        didSet {
            self.tableView.reloadData()
        }
    }
    var filteredSongs: [Song] {
        guard let searchTerm = searchTerm, searchTerm != "" else {
            return allSongs
        }
        guard let scopeTitles = searchBar.scopeButtonTitles else {
            return allSongs
        }
        let selectedIndex = searchBar.selectedScopeButtonIndex
        let filteringCriteria =  scopeTitles[selectedIndex]
        switch filteringCriteria {
        case "Name":
            return allSongs.filter({$0.name.lowercased().contains(searchTerm.lowercased())})
        case "Artist":
            return allSongs.filter({$0.artist.lowercased().contains(searchTerm.lowercased())})
        default:
            return allSongs
        }
       // return allSongs.filter({$0.name.lowercased().contains(searchTerm.lowercased())})
    }
  
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
       self.allSongs = Song.loveSongs
    }
    
    //MARK: tableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.filteredSongs.count == 0 {
            return 1
        }
        return filteredSongs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.filteredSongs.count == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Love Song", for: indexPath)
            cell.textLabel?.text = "No item found"
            cell.detailTextLabel?.text = ""
            return cell
        }
        let song = filteredSongs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Love Song", for: indexPath)

        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        return cell
        
    }
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? DetailViewController {
        let selectedRow = self.tableView.indexPathForSelectedRow!.row
        let selectedSong = allSongs[selectedRow]
        destination.song = selectedSong
    }
}
    //MARK: Search Bar Data Source
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           self.searchTerm = searchBar.text
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = searchBar.text
        searchBar.resignFirstResponder()
        print("User clicked search bar")
       
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        tableView.reloadData()
    }
}
