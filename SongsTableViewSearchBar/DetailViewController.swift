//
//  DetailViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Bienbenido Angeles on 12/3/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var song:Song?
    
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        songLabel.text = song?.name
        artistLabel.text = song?.artist
        imageView.image = UIImage(named: "loveSongs")
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
