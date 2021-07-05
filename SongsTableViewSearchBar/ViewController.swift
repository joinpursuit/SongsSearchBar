//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var songArr = [Song]()
    var searchText: String? = nil {
        didSet {
            self.tableView.reloadData()
        }
    }
    var filteredSongs: [Song] {
        guard let seachText = searchText else {
            return songArr
        }
        return songArr.filter{$0.name.lowercased().contains(searchText!.lowercased())}
    }
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        songArr = Song.loveSongs//populates on load
    }
    //MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //            print("Asking data source for #of rows and it is \(filteredPersonArr.count)")
        return filteredSongs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        cell.textLabel?.text = filteredSongs[indexPath.row].name
        cell.detailTextLabel?.text = filteredSongs[indexPath.row].artist
        print(cell)
        return cell
    }
    
    //func searchBa
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SongVCSegue" {
            if let destination = segue.destination as? SongViewController {
                destination.song = songArr[tableView.indexPathForSelectedRow!.row]
            }
        }
    
    }
    
}

