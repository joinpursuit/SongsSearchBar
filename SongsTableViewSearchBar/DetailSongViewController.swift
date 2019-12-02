//
//  DetailSongViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Yuliia Engman on 12/2/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailSongViewController: UIViewController {

     @IBOutlet weak var image: UIImageView!
        @IBOutlet weak var songLabel: UILabel!
        @IBOutlet weak var artistLabel: UILabel!
        
        
        var songs: Song?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            updateUI()
        }

        func updateUI() {
            guard let song = songs else {
                fatalError("song is nil, verify prepare for segue")
            }
            
            image.image = UIImage(named: "loveSongs")
            songLabel.text = song.name
            artistLabel.text = song.artist
            
        }
    }
