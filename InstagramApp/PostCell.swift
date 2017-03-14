//
//  PostCell.swift
//  InstagramApp
//
//  Created by Sandeep Raghunandhan on 3/13/17.
//  Copyright © 2017 Sandeep Raghunandhan. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var caption: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
