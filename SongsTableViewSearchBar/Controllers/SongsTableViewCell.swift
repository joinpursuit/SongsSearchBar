//
//  SongsTableViewCell.swift
//  SongsTableViewSearchBar
//
//  Created by Mariel Hoepelman on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//
import Foundation
import UIKit

class SongsTableViewCell: UITableViewCell {

   @IBOutlet weak var songNameLabel: UILabel!
    
    @IBOutlet weak var bandLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}


