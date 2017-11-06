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
    @IBOutlet weak var songTableView: UITableView!
    
    var delegate: UITableViewDelegate?
    
    private var searchTerm: String? = nil
    private var filteredSongs: [Song] {
        
        let songs: [Song]!
        
        guard let searchTerm = searchTerm,
                let scopeButtonTitles = searchBar.scopeButtonTitles,
                    !searchTerm.isEmpty else {
            songs = Song.loveSongs
            return songs
        }
        
        let selectedScopeBar = self.searchBar.selectedScopeButtonIndex
        let currentScope = scopeButtonTitles[selectedScopeBar]
        
        switch currentScope {
        case "Songs":
            songs = Song.loveSongs.filter{$0.name.lowercased().contains(searchTerm.lowercased())}
        case "Artist":
            songs =  Song.loveSongs.filter{$0.artist.lowercased().contains(searchTerm.lowercased())}
        default:
            songs = Song.loveSongs
        }
        
        if songs.isEmpty {
            songs.append(Song(name: "No results", artist: "No results"))
            searchBar.resignFirstResponder()
        }
        
        return songs
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.songTableView.delegate = self
        self.songTableView.dataSource = self
        self.searchBar.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - Table View Delegate
extension ViewController: UITableViewDelegate {
    // MARK: Cell Selection
    
    
    // MARK: Section Header Configuration
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
}

// MARK: - Table View Data Source
extension ViewController: UITableViewDataSource {
    
    // MARK: Table Formation
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSongs.count
    }
    
    // MARK: Cell Rendering
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = songTableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        let index = indexPath.row
        let currentSong = filteredSongs[index]
        cell.textLabel?.text = currentSong.name
        cell.detailTextLabel?.text = currentSong.artist
        return cell
    }
    
}

// MARK: - Search Bar Delegate
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTerm = searchText
        songTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        songTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchTerm = nil
        songTableView.reloadData()
    }
}
