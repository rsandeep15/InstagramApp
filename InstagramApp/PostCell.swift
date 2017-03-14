//
//  PostCell.swift
//  InstagramApp
//
//  Created by Sandeep Raghunandhan on 3/13/17.
//  Copyright © 2017 Sandeep Raghunandhan. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostCell: UITableViewCell {

    @IBOutlet weak var postImage: PFImageView?
    @IBOutlet weak var caption: UILabel!
    
    var post: PFObject? {
        didSet {
            caption.text = post!["caption"] as! String
            self.postImage?.file = post!["media"] as? PFFile
            self.postImage?.loadInBackground()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
