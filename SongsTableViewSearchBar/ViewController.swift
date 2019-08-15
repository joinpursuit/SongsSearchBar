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
    var searchString: String? = nil {
        didSet {
            self.tableOutlet.reloadData()
        }
    }
//    var songSearchResults: [Song] {
//        get {
//            guard let _ = searchString else {
//                return songs
//            }
//            guard searchString != "" else {
//                return songs
//            }
//            if let scopeTitles = sea {
//                let currentScopeIndex = searchBarOutlet.selectedScopeButtonIndex
//
//                switch scopeTitles[currentScopeIndex] {
//                case "Title":
//                    return songs.filter {$0.name.contains(searchString!.lowercased()) }
//                case "Phone":
//                    return songs.filter { $0.artist.contains(searchString!.lowercased()) }
//                default:
//                    return songs
//                }
//        }
//    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableOutlet.dequeueReusableCell(withIdentifier: "Song")
        
        cell?.textLabel?.text = songs[indexPath.row].name
        cell?.detailTextLabel?.text = songs[indexPath.row].artist
        
        return cell!
    }
    

    
    @IBOutlet weak var tableOutlet: UITableView!
    
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarOutlet.delegate = self
        tableOutlet.dataSource = self
        tableOutlet.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

