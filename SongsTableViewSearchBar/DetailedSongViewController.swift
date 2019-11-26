//
//  DetailedSongViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Cameron Rivera on 11/26/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailedSongViewController: UIViewController {

    @IBOutlet weak var defaultImage: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var songName: UILabel!
    
    var selectedSong: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        artistLabel.text = selectedSong?.artist
        songName.text = selectedSong?.name
        defaultImage.image = UIImage(named:"loveSongs")
    }

}
