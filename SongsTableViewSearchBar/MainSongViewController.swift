//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class MainSongViewController: UIViewController {

        @IBOutlet weak var tableView: UITableView!
        
        var songs = [Song]() {
            didSet {
                tableView.reloadData()
            }
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.dataSource = self
            
            loadData()
        }
        
        func loadData() {
            songs = Song.loveSongs
        }
    }
        
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        guard let songsDetailController = segue.destination as? DetailSongViewController, let indexPath = tableView.indexPathForSelectedRow else {
    //            fatalError("verify class name in identity inspector")
    //    }
    //        let song = songs[indexPath.row]
    //        songsDetailController.songs = song
    //    }
        
        //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        // 1. get destination view controller
        //        // 2. indexpath user selected from the tableview
        //        guard let newsDetailController = segue.destination as? NewsDetailController,
        //            let indexPath = tableView.indexPathForSelectedRow else {
        //            fatalError("verify class name in identity inspector")
        //        }
        //
        //        // 3. get the selected headline
        //        let headline = headlines[indexPath.row]
        //
        //        // 4. set the newsDetailController newsHeadline
        //        newsDetailController.newsHeadline = headline
        //    }
        //}

    extension MainSongViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return songs.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        let song = songs[indexPath.row]
        
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        
        return cell
        }
    }
    //extension NewsFeedController: UITableViewDataSource {
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return headlines.count //39 headlines
    //    }
    //
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //
    //        guard let cell = tableView.dequeueReusableCell(withIdentifier: "headlineCell", for: indexPath) as? HeadLineCell else {
    //            fatalError("could't deques a HeadlineCell")
    //        }
    //
    //        // get object (headline) at the current indexPath
    //
    //        let headline = headlines[indexPath.row]
    //
    //        cell.configureCell(for: headline)
    //
    //        return cell
    //    }
    //}




    //
    //
    //
    //enum SearchScope {
    //    case title // title of headline
    //    case abstract // a summary of the headline
    //}
    // here were @IBOutlets

    //    var headlines = [NewsHeadline]() {
    //    didSet {
    //        tableView.reloadData()
    //    }
    //    }
    //
    //    var currentScope = SearchScope.title // default value is 0 "Title"
    //
    //    //TODO: create a variable called searchQuery the calls filter method
    //
    //    var searchQuery = "" {
    //        didSet {
    //            switch currentScope {
    //            case .title:
    //                headlines = HeadlinesData.getHeadlines().filter { $0.title.lowercased().contains(searchQuery.lowercased())}
    //            case .abstract:
    //                headlines = HeadlinesData.getHeadlines().filter { $0.abstract.lowercased().contains(searchQuery.lowercased())}
    //            }
    //        }
    //    }
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        tableView.dataSource = self
    //        tableView.delegate = self
    //        searchBar.delegate = self
    //        loadData()
    //
    //        //dump(HeadlinesData.getHeadlines())
    //    }
    //
    ///    func loadData() {
    //        headlines = HeadlinesData.getHeadlines() // [NewsHeadline]
    //    }
    //
    //    func filterHeadlines(for searchText: String) {
    //        // we guarding against and empty search query
    //        guard !searchText.isEmpty else { return }
    //        headlines = HeadlinesData.getHeadlines().filter{ $0.title.lowercased().contains(searchText.lowercased())}
    //    }
    //
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        // 1. get destination view controller
    //        // 2. indexpath user selected from the tableview
    //        guard let newsDetailController = segue.destination as? NewsDetailController,
    //            let indexPath = tableView.indexPathForSelectedRow else {
    //            fatalError("verify class name in identity inspector")
    //        }
    //
    //        // 3. get the selected headline
    //        let headline = headlines[indexPath.row]
    //
    //        // 4. set the newsDetailController newsHeadline
    //        newsDetailController.newsHeadline = headline
    //    }
    //}
    //
    //extension NewsFeedController: UITableViewDataSource {
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return headlines.count //39 headlines
    //    }
    //
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //
    //        guard let cell = tableView.dequeueReusableCell(withIdentifier: "headlineCell", for: indexPath) as? HeadLineCell else {
    //            fatalError("could't deques a HeadlineCell")
    //        }
    //
    //        // get object (headline) at the current indexPath
    //
    //        let headline = headlines[indexPath.row]
    //
    //        cell.configureCell(for: headline)
    //
    //        return cell
    //    }
    //}
    //
    ///extension NewsFeedController: UITableViewDelegate {
    ///    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    ///        return 180
    ///    }
    ///}
    //
    //
    //extension NewsFeedController: UISearchBarDelegate {
    //    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    //        //dismiss the keyboard
    //        searchBar.resignFirstResponder()
    //
    ////       // print("\(searchBar.text) was entered")
    ////       // when user search in searchBar we want to filter data in our tableVoiew
    ////
    ////        guard let searchText = searchBar.text else {
    ////            //TODO:
    ////            return
    ////        }
    ////        filterHeadlines(for: searchText)
    //    }
    //
    //
    //    // what is searchBar is emplty
    //
    //     // realtime searching when user types
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //       // searchBar.resignFirstResponder()
    ////        print("searchText: \(searchText)")
    ////
    ////        filterHeadlines(for: searchText)
    //
    //        guard !searchText.isEmpty else { // if searBar is not empty go to line 98 (filterHeadlines(for: searchText)
    //            // searchText is empty here so we get back all the original headlines
    //            // using our loadData() method
    //            loadData()
    //            return
    //        }
    //        searchQuery = searchText
    //        //filterHeadlines(for: searchText)
    //    }
    //    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    //        //print("delectedScope: \(selectedScope)")
    //        switch selectedScope {
    //        case 0:
    //            currentScope = SearchScope.title // .title
    //        case 1:
    //            currentScope = .abstract
    //        default:
    //            print("not a valid search scope")
    //        }
    //    }
    //}

