//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var songs = Song.loveSongs
    var songSearchResults: [Song] {
        get {
            guard let _ = searchString else {
                return songs
            }
            guard searchString != "" else {
                return songs
            }
            
            if let scopeTitles = searchBarOutlet.scopeButtonTitles {
                let currentScopeIndex = searchBarOutlet.selectedScopeButtonIndex

                switch scopeTitles[currentScopeIndex] {
                case "Title":
                    let results = songs.filter{ $0.name.lowercased().contains(searchString!.lowercased())}
                    if results.count == 0 {
                        messageOutlet.isHidden = false
                        searchBarOutlet.resignFirstResponder()
                    } else {
                        messageOutlet.isHidden = true
                    }
                    return results
                case "Artist":
                    let results = songs.filter { $0.artist.lowercased().contains(searchString!.lowercased()) }
                    if results.count == 0 {
                        messageOutlet.isHidden = false
                        searchBarOutlet.resignFirstResponder()
                    } else {
                        messageOutlet.isHidden = true
                    }
                    return results
                default:
                    return songs
                }
        }
            return songs
    }
    }
    var searchString: String? = nil {
        didSet {
            self.tableOutlet.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songSearchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOutlet.dequeueReusableCell(withIdentifier: "Song")
        
        cell?.textLabel?.text = songSearchResults[indexPath.row].name
        cell?.detailTextLabel?.text = songSearchResults[indexPath.row].artist
        
        return cell!
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBarOutlet.resignFirstResponder()
        searchString = searchBarOutlet.text
    }
    
    @IBOutlet weak var tableOutlet: UITableView!
    
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    @IBOutlet weak var messageOutlet: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {fatalError("No identifier in segue")}
        
        if segueIdentifier == "toDetailView" {
            guard let detailVC = segue.destination as? DetailViewController else {
                fatalError("Unexpected segue view controller" )}
            
            guard let selectedIndexPath = tableOutlet.indexPathForSelectedRow else { fatalError("No row selected")}
        
            detailVC.music = songs[selectedIndexPath.row]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarOutlet.delegate = self
        tableOutlet.dataSource = self
        tableOutlet.delegate = self
        messageOutlet.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

