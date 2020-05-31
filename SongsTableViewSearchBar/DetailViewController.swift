//
//  DetailViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    var song: Song?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let song = song else {
            return
        }
        self.nameLabel?.text = song.name
        self.artistLabel?.text = song.artist
        self.imageview.image = #imageLiteral(resourceName: "loveSongs")
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
