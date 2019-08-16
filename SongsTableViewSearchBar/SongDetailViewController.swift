//
//  SongDetailViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Levi Davis on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {
    
    var song: Song!
    
    
    @IBOutlet weak var songImageOutlet: UIImageView!
    @IBOutlet weak var songNameOutlet: UILabel!
    @IBOutlet weak var artistNameOutlet: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view.
    }
    
    private func setUpViews() {
        songNameOutlet.text = song.name
        artistNameOutlet.text = song.artist
        songImageOutlet.image = UIImage(named: "loveSongs")
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
