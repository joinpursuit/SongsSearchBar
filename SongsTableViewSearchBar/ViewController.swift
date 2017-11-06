//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var songs: [Song] = [] {
        didSet {
            songs.forEach{$0.printSwiftInitializer()}
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let str = "http://billboard.modulo.site/search/song?q=love"
        guard let url = URL(string: str) else {
            return
        }
        let session = URLSession.shared.dataTask(with: url){(data, response, error) in
            guard let data = data else {
                return
            }
            guard let _ = response else {
                return
            }
            if let _ = error {
                return
            }
            var songs: [Song] = []
            do {
                let apiSongs = try JSONDecoder().decode([SongAPI].self, from: data)
                songs = apiSongs.map{Song(from: $0)}
            }
            catch {
                print("Whoops")
            }
            DispatchQueue.main.async {
                self.songs = songs
            }
        }
        session.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

