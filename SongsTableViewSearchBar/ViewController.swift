//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
   
    let songData = Song.loveSongs
    
    var searchBarResults: [Song] {
        get {
            guard let searchString = searchString else {
                return songData
            }
            guard searchString != "" else {
                return songData
            }
            if let scopeTitles = songSearchBar.scopeButtonTitles {
                let currentScopeIndex = songSearchBar.selectedScopeButtonIndex
                switch scopeTitles[currentScopeIndex] {
                case "Song":
                    return songData.filter{$0.name.lowercased().contains(searchString)}
                case "Artist":
                    return songData.filter{$0.artist.lowercased().contains(searchString)}
                default:
                    return songData
                }
            }
            return songData
//                songData.filter{$0.name.contains(searchString.lowercased())}
        }
    }
    
    var searchString: String? = nil {
        didSet {
            self.songTableView.reloadData()
        }
    }

    
    @IBOutlet weak var songSearchBar: UISearchBar!
    @IBOutlet weak var songTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchBarResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = songTableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        cell.textLabel?.text = searchBarResults[indexPath.row].name
        cell.detailTextLabel?.text = searchBarResults[indexPath.row].artist
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "SongDetailViewController") as? SongDetailViewController {
            viewController.song = searchBarResults[indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text?.lowercased()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        songTableView.dataSource = self
        songTableView.delegate = self
        songSearchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

//extension ViewController: UISearchBarDelegate {
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        searchString = searchBar.text?.lowercased()
//    }
//}

