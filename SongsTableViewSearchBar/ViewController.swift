//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var noResultsLabel: UILabel!
    
    var songArr = [Song]()
    var filteredSongArr: [Song] {
        get {
            guard let searchTerm = searchTerm, !searchTerm.isEmpty else {
                return songArr
            }
            
            guard let selectedCategory = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex] else {
                return songArr
            }
            
            switch selectedCategory {
            case "Songs":
                return songArr.filter{$0.name.lowercased().contains(searchTerm.lowercased())}
            case "Artist":
                return songArr.filter{$0.artist.lowercased().contains(searchTerm.lowercased())}
            default:
                return songArr
            }
        }
    }
    var searchTerm: String? {
        didSet {
            tableView.reloadData()
            noResultsLabel.isHidden = !noResults
        }
    }
    var noResults = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        songArr = Song.loveSongs
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        noResults = filteredSongArr.count == 0
        return filteredSongArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
//        guard !noResults else {
//            cell.textLabel?.text = "No Results"
//            cell.detailTextLabel?.text = ""
//            return cell
//        }
        
        let song = filteredSongArr[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tappedSongCell: UITableViewCell = sender as? UITableViewCell {
            if segue.identifier == "SongDetailViewSegue" {
                let songDetailViewController: SongDetailViewController = segue.destination as! SongDetailViewController
                
                let cellIndexPath = tableView.indexPath(for: tappedSongCell)!
                let cellSong: Song = filteredSongArr[cellIndexPath.row]
                
                songDetailViewController.selectedSong = cellSong
            }
        }
    }
    //MARK: - Search Bar Delegate Methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         searchTerm = searchText
        if tableView.numberOfRows(inSection: 0) == 0 {
            searchBar.resignFirstResponder()
        }
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        tableView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()\
    }
    
}

