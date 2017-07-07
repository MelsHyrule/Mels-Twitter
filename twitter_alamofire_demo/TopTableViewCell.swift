//
//  TopTableViewCell.swift
//  twitter_alamofire_demo
//
//  Created by Melody Ann Seda Marotte on 7/7/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage


class TopTableViewCell: UITableViewCell {

    
    var user: User! {
        didSet {
            
            
//        profileBackgroundImageView.af_setImage(withURL: user.backgroundPictureURL!)
            
            profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
            profileImageView.layer.masksToBounds = true
            profileImageView.af_setImage(withURL: user.profilePictureURL!)
            
            screenNameLabel.text = user.name
            usernameLabel.text = "@" + user.screenName!
            bioLabel.text = user.description
            followingCounerLabel.text = String(user.following!)
            followersCounterLabel.text = String(user.followers!)
            
        }
    }

    
    @IBOutlet weak var profileBackgroundImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var followingCounerLabel: UILabel!
    @IBOutlet weak var followersCounterLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
