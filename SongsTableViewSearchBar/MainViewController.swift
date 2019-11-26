//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

enum Scope{
    case title
    case artist
}

class MainViewController: UIViewController {

    // MARK: Outlets of MainViewController
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: Properties of MainViewController
    var listOfSongs: [Song] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    var userQuery = "" {
        didSet{
            switch currentScope{
            case .artist:
                listOfSongs = Song.loveSongs.filter{ $0.artist.lowercased().contains(userQuery.lowercased()) }
            case .title:
                listOfSongs = Song.loveSongs.filter{ $0.name.lowercased().contains(userQuery.lowercased()) }
            }
            if listOfSongs.isEmpty{
                listOfSongs.append(Song(name: "No Search Results Found", artist:""))
                searchBar.resignFirstResponder()
            }
        }
    }
    
    var currentScope: Scope = .artist
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        setUp()
        
    }
    // MARK: Helper Methods
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setUp(){
        listOfSongs = Song.loveSongs
    }

}
// MARK: TableView Data Source
extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xCell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        xCell.textLabel?.text = listOfSongs[indexPath.row].name
        xCell.detailTextLabel?.text = listOfSongs[indexPath.row].artist
        return xCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfSongs.count
    }
}

// MARK: TableView Delegate
extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondSB = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        guard let detailedSongVC = secondSB.instantiateViewController(withIdentifier: "detailedSongVC") as? DetailedSongViewController else{
            fatalError("Could not access instance of DetailedSongViewController ")
        }
        detailedSongVC.selectedSong = listOfSongs[indexPath.row]
        navigationController?.pushViewController(detailedSongVC, animated: true)
    }
}

// MARK: SearchBar Delegate
extension MainViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else{
            listOfSongs = Song.loveSongs
            return
        }
        userQuery = searchText
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope{
        case 0:
            currentScope = Scope.artist
        case 1:
            currentScope = Scope.title
        default:
            break
        }
    }
}
