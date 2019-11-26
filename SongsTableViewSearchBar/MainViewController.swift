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

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
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
        }
    }
    
    var currentScope: Scope = .artist
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        setUp()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setUp(){
        listOfSongs = Song.loveSongs
    }

}

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

extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondSB = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        let detailedSongVC = secondSB.instantiateViewController(withIdentifier: "detailedSongVC") as! DetailedSongViewController
        detailedSongVC.selectedSong = listOfSongs[indexPath.row]
        navigationController?.pushViewController(detailedSongVC, animated: true)
    }
}

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
