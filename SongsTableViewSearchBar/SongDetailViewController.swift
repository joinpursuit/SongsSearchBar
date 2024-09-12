//
//  SongDetailViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SongDetailViewController: UIViewController {

    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songArtist: UILabel!
    
    var selectedSong: Song!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateViews(for: selectedSong)
        // Do any additional setup after loading the view.
    }
    
    func updateViews(for song: Song) {
        self.songImage.image = UIImage(named: "loveSongs")
        self.songTitle.text = song.name
        self.songArtist.text = song.artist
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let tappedSongCell: UITableViewCell = sender as? UITableViewCell {
//        if segue.identifier == "SongDetailViewSegue" {
//            let songDetailViewController: SongDetailViewController = segue.destination as! SongDetailViewController
//            let cellIndexPath = UITableView().indexPath(for: tappedSongCell)!
//            
//            let cellSong = Song.loveSongs[cellIndexPath.row]
//        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
