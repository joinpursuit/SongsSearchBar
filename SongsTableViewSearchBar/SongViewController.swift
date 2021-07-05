//
//  SongCellViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Lisa J on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SongViewController: UIViewController {
    @IBOutlet weak var songImageView: UIImageView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    var song: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let song = song else {
            return
        }
        songImageView.image = #imageLiteral(resourceName: "loveSongs")
        songLabel.text = song.name
        artistLabel.text = song.artist
        
        
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
