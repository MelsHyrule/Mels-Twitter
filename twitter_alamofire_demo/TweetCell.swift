//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

protocol TweetCellDelegate {
    func didTapReply(tweet: Tweet)
}

class TweetCell: UITableViewCell {
    
//    weak var delegate: TweetCellDelegate!
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var datePostedLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    //@IBOutlet weak var replyCountLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    var id: Int64!
    
    var tweet: Tweet! {
        didSet {
            id = tweet.id
            
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
    
    @IBAction func retweetButtonPressed(_ sender: UIButton) {
        
        if (sender.isSelected) {
            tweet.retweeted = false
            tweet.retweetCount = tweet.retweetCount - 1
//            APIManager.shared.unretweet(tweetID: id)
            APIManager.shared.unretweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }

        } else {
            sender.isSelected = true
            tweet.retweetCount = tweet.retweetCount + 1
//            APIManager.shared.retweet(tweetID: id)
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }

        }
        retweetCountLabel.text = String(tweet.retweetCount)
    }
    
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        if (sender.isSelected) {
            sender.isSelected = false
            tweet.favoriteCount = tweet.favoriteCount! - 1
//            APIManager.shared.unfavorited(tweetID: id)
            APIManager.shared.unfavorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        } else {
            sender.isSelected = true
            tweet.favoriteCount = tweet.favoriteCount! + 1
//            APIManager.shared.favorited(tweetID: id)
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }

        }
        likeCountLabel.text = String(tweet.favoriteCount!)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
