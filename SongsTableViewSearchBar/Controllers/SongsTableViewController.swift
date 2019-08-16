//
//  SongsTableViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Mariel Hoepelman on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController {

    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    var song = Song.loveSongs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarOutlet.delegate = self
    }

    var songSearchResult:[Song] {
        get {
            guard let searchString = searchString else {
                return song
            }
            guard searchString != "" else {
                return song
            }
            if let scopeTitles = searchBarOutlet.scopeButtonTitles {
                let currentScopeIndex = searchBarOutlet.selectedScopeButtonIndex
                switch scopeTitles[currentScopeIndex] {
                case "Songs":
                    let songResults = song.filter{$0.name.lowercased().contains(searchString.lowercased())}
                    if songResults.count > 0 {
                        return songResults
                    }else{
                        showNotFoundAlert(titleType: "Song")
                    }
                case "Artists":
                    let artistResults = song.filter{$0.artist.lowercased().contains(searchString.lowercased())}
                    if artistResults.count > 0 {
                        return artistResults
                    }else{
                        showNotFoundAlert(titleType: "Artist")
                    }
                default:
                    return song
                }
            }
            return song
        }
    }
    
    func showNotFoundAlert(titleType: String) -> Void {
        let alert = UIAlertController(title: "\u{1F5E3} \(titleType) not found!", message: "Please try again", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    var searchString: String? = nil {
        didSet {
            self.tableView.reloadData()
        }
    }

     // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songSearchResult.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "songTVC", for: indexPath) as? SongsTableViewCell {
            cell.songNameLabel?.text = songSearchResult[indexPath.row].name
            cell.bandLabel?.text = songSearchResult[indexPath.row].artist
            return cell
        }
        return UITableViewCell()
    }

}

extension SongsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchString = searchBar.text
    }
    
}
