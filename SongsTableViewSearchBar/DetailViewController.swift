//
//  DetailViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Ahad Islam on 12/9/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    var song: Song!

    override func viewDidLoad() {
        super.viewDidLoad()
        artistLabel.numberOfLines = 0
        songLabel.numberOfLines = 0

        artistLabel.text = song.artist
        songLabel.text = song.name
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
