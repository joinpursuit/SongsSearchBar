//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var songs: [Song] = []
    var searchText: String? = nil {
        didSet {
            self.tableView.reloadData()
        }
    }
    var filteredSongs: [Song] {
        guard let searchText = searchText else {
            return songs
        }
        return songs.filter{$0.name.lowercased().contains(searchText.lowercased())}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        songs = Song.loveSongs
    }
    
    //MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSongs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = filteredSongs[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        cell.imageView?.image = UIImage(named: "loveSongs")
        return cell
    }
    
    //MARK: - Search Bar Delegate Methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
    }

}

