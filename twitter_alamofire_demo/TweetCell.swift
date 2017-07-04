//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var datePostedLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    //@IBOutlet weak var tweetTextView: UITextView!
    //@IBOutlet weak var replyCountLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            
            userImageView.af_setImage(withURL: tweet.user.profilePictureURL!)
            
            screenNameLabel.text = tweet.user.screenName!
            nameLabel.text = tweet.user.name as! String
            datePostedLabel.text = tweet.createdAtString
            tweetLabel.text = tweet.text
            //replyCountLabel.text =
            retweetCountLabel.text = String(tweet.retweetCount)
            likeCountLabel.text = String(tweet.favoriteCount!)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
        
    
    @IBAction func replyButtonPressed(_ sender: Any) {
        //code
    }
    
    
    
    @IBAction func retweetButtonPressed(_ sender: Any) {
        if (tweet.retweeted) {
            tweet.retweeted = false
            tweet.retweetCount = tweet.retweetCount - 1
            retweetCountLabel.text = String(tweet.retweetCount)
        } else {
            tweet.retweeted = true
            tweet.retweetCount = tweet.retweetCount + 1
            retweetCountLabel.text = String(tweet.retweetCount)
        }
    }
    
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        if (tweet.favorited!) {
            tweet.favorited = false
            tweet.favoriteCount = tweet.favoriteCount! - 1
            likeCountLabel.text = String(tweet.favoriteCount!)
        } else {
            tweet.favorited = true
            tweet.favoriteCount = tweet.favoriteCount! + 1
            likeCountLabel.text = String(tweet.favoriteCount!)

        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
