//
//  SongDetailsViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Sunni Tang on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongDetailsViewController: UIViewController {

    var song: Song!
    
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var songArtistLabel: UILabel!
    @IBOutlet weak var songImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.songNameLabel?.text = song.name
        self.songArtistLabel?.text = song.artist
        self.songImage.image = UIImage(named: "loveSongs")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
