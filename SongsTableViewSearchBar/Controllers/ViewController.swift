
//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let songs = Song.loveSongs
    
    
    var searchString: String? = nil {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var songSearchResults: [Song] {
        get {
            guard let searchString = searchString else {
                return songs
            }
            
            guard searchString != "" else {
                return songs
            }
            
            if let scopeTitles = searchBar.scopeButtonTitles {
                let currentScopeIndex = searchBar.selectedScopeButtonIndex
                
                switch scopeTitles[currentScopeIndex] {
                case "Songs":
                    return songs.filter{$0.name.contains(searchString.lowercased())}
                case "Artists":
                    return songs.filter{$0.artist.contains(searchString.lowercased())}
                default:
                    return songs
                }
                
            }
            return songs
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {
            fatalError("No identifier in segue")
        }
        
        switch segueIdentifier {
        case "cellToDetailSegue":
            
            guard let songDetailsVC = segue.destination as? SongDetailsViewController else {
                fatalError("No VC")
            }
            
            guard let selectedIndexPath = self.tableView.indexPathForSelectedRow  else {
                fatalError("No row was selected")
            }
            
            songDetailsVC.song = songs[selectedIndexPath.row]
            
        default:
            fatalError("Unexpected segue identifier")
        }
    }

}




extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = songs[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        
        return cell
    }
    
}






