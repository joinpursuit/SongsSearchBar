//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class MainSongViewController: UIViewController {
    
    enum SearchScope {
        case name // name of the song
        case artist // artist name
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var songs = [Song]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var currentScope = SearchScope.name
    
    var searchQuery = "" {
        didSet {
            switch currentScope {
            case .name:
                songs = Song.loveSongs.filter { $0.name.lowercased().contains(searchQuery.lowercased())}
            case .artist:
                songs = Song.loveSongs.filter { $0.artist.lowercased().contains(searchQuery.lowercased())}
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        
        loadData()
    }
    
    func loadData() {
        songs = Song.loveSongs
    }
    
    func filterSongsName(for searchText: String) {
        // we guarding against and empty search query
        guard !searchText.isEmpty else { return }
        songs = Song.loveSongs.filter{ $0.name.lowercased().contains(searchText.lowercased())}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let songsDetailController = segue.destination as? DetailSongViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("verify class name in identity inspector")
        }
        let song = songs[indexPath.row]
        songsDetailController.songs = song
    }
}

extension MainSongViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        let song = songs[indexPath.row]
        
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        
        return cell
    }
}


extension MainSongViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard let searchText = searchBar.text else {
            return
        }
        filterSongsName(for: searchText)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            loadData()
            return
        }
        searchQuery = searchText
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            currentScope = SearchScope.name
        case 1:
            currentScope = SearchScope.artist
        default:
            print("not a valid search scope")
        }
    }
}




