//
//  DetailViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Kevin Natera on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var music: Song!
    
    @IBOutlet weak var loveSongImageOutlet: UIImageView!
    
    @IBOutlet weak var songTitleLabel: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songTitleLabel.text = music.name
        artistLabel.text = "by \(music.artist)"
        loveSongImageOutlet.image = UIImage(named: "loveSongs")
    }
    
}
