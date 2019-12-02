//
//  SongDetailViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Liubov Kaper  on 12/1/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var songLabel: UILabel!
    
    
    
    @IBOutlet weak var artistLabel: UILabel!
    
    var song: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    func updateUI() {
        guard let currentSong = song else {
            fatalError("check prepare for segue")
        }
        navigationItem.title = currentSong.name
        imageView.image = UIImage(named: "loveSongs")
        songLabel.text = currentSong.name
        artistLabel.text = currentSong.artist
    }
    
    
}
