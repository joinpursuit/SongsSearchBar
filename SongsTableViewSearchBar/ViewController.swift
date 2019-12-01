//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

enum SearchScope {
    case song
    case artist
}

class ViewController: UIViewController {
    
  @IBOutlet weak var tableView: UITableView!
    
  @IBOutlet weak var searchBar: UISearchBar!
    
    var allSongs = [Song]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var currentScope = SearchScope.song
    
    var searchQuary = "" {
        didSet {
            switch currentScope {
            case .song:
                allSongs = Song.loveSongs.filter { $0.name.lowercased().contains(searchQuary.lowercased())}
            case .artist:
                allSongs = Song.loveSongs.filter { $0.artist.lowercased().contains(searchQuary.lowercased())}
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      loadData()
        tableView.dataSource = self
        searchBar.delegate = self 
        
    }

    func loadData() {
        allSongs = Song.loveSongs
    }
    
    func filterSongs(for searchText: String)  {
        guard !searchText.isEmpty else { return }
        allSongs = Song.loveSongs.filter { $0.name.lowercased().contains(searchText.lowercased())}
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailViewController = segue.destination as? SongDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
           fatalError()
           
        }
         let song = allSongs[indexPath.row]
        detailViewController.song = song 
    }

}

extension ViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        let song = allSongs[indexPath.row]
        
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        return cell 
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            loadData()
            return
        }
        searchQuary = searchText
        //filterSongs(for: searchText)
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            currentScope = .song
        case 1:
            currentScope = .artist
        default:
            print("not a valid searchScope")
        }
    }
}
