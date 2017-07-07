//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

protocol TweetCellDelegate: class {
    // TODO: Add required methods the delegate needs to implement
    func tweetCell(_ tweetCell: TweetCell, didTap user: User)
}


class TweetCell: UITableViewCell {
    
    weak var delegate: TweetCellDelegate?
    var test: TimelineViewController!
    
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
            refreshTweet()
        }
    }
    
    func refreshTweet() {
        id = tweet.id
        userImageView.af_setImage(withURL: tweet.user.profilePictureURL!)
        
        screenNameLabel.text = tweet.user.name as! String
        nameLabel.text = "@" + tweet.user.screenName!
        
        datePostedLabel.text = tweet.createdAtString
        tweetLabel.text = tweet.text
        retweetCountLabel.text = String(tweet.retweetCount)
        likeCountLabel.text = String(tweet.favoriteCount!)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let profileTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTapUserProfile(_:)))
        
        userImageView.addGestureRecognizer(profileTapGestureRecognizer)
        userImageView.isUserInteractionEnabled = true
    }
    
    
    @IBAction func replyButtonPressed(_ sender: Any) {
        //code
    }
    
    
    @IBAction func retweetButtonPressed(_ sender: UIButton) {
        refreshTweet()
        
        sender.isSelected = !sender.isSelected
        tweet.retweeted = sender.isSelected
        print("\n in retweet button")
        if (tweet.retweeted) {
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error retweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully retweeted the following Tweet: \n\(tweet.text)")
                    tweet.retweetCount += 1
                    self.retweetCountLabel.text = String(tweet.retweetCount)
                    self.refreshTweet()
                }
            }
        } else {
            APIManager.shared.unretweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unretweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unretweeted the following Tweet: \n\(tweet.text)")
                    tweet.retweetCount -= 1
                    self.retweetCountLabel.text = String(tweet.retweetCount)
                    self.refreshTweet()
                }
            }
        }
    }
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        refreshTweet()
        
        sender.isSelected = !sender.isSelected
        tweet.favorited = sender.isSelected
        print("\n in like button")
        if (tweet.favorited)! {
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                    self.tweet.favoriteCount! += 1
                    self.likeCountLabel.text = String(tweet.favoriteCount!)
                    self.refreshTweet()
                }
            }
        } else {
            APIManager.shared.unfavorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unfavoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
                    self.tweet.favoriteCount! -= 1
                    self.likeCountLabel.text = String(tweet.favoriteCount!)
                    self.refreshTweet()
                }
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        //        print("lmao")
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func didTapUserProfile(_ sender: UITapGestureRecognizer) {
        // TODO: Call method on delegate
        delegate?.tweetCell(self, didTap: tweet.user)
    }
    
}
