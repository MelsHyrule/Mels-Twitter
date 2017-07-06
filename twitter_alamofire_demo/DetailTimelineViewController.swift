//
//  DetailTimelineViewController.swift
//  twitter_alamofire_demo
//
//  Created by Melody Ann Seda Marotte on 7/5/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit

class DetailTimelineViewController: UIViewController {

    //outlets
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var datePostedLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImageView.layer.cornerRadius = userImageView.frame.size.width/2
        userImageView.layer.masksToBounds = true
        userImageView.af_setImage(withURL: tweet.user.profilePictureURL!)
        
        screenNameLabel.text = tweet.user.screenName!
        nameLabel.text = tweet.user.name as! String
        tweetLabel.text = tweet.text
        datePostedLabel.text = tweet.createdAtString
        retweetCountLabel.text = String(tweet.retweetCount)
        likeCountLabel.text = String(tweet.favoriteCount!)

        tweet.favorited = favoriteButton.isSelected
        tweet.retweeted = retweetButton.isSelected
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func retweetButtonPressed(_ sender: UIButton) {
//        sender.isSelected = !sender.isSelected
//        tweet.retweeted = sender.isSelected
//        print("in retweet")
//        if (tweet.retweeted) {
//            tweet.retweetCount += 1
//            retweetCountLabel.text = String(tweet.retweetCount)
//            APIManager.shared.unretweet(tweet) { (tweet: Tweet?, error: Error?) in
//                if let  error = error {
//                    print("Error unretweeting tweet: \(error.localizedDescription)")
//                } else if let tweet = tweet {
//                    print("Successfully unretweeted the following Tweet: \n\(tweet.text)")
//                }
//            }
//        } else {
//            tweet.retweetCount -= 1
//            retweetCountLabel.text = String(tweet.retweetCount)
//            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
//                if let  error = error {
//                    print("Error retweeting tweet: \(error.localizedDescription)")
//                } else if let tweet = tweet {
//                    print("Successfully retweeted the following Tweet: \n\(tweet.text)")
//                }
//            }
//        }
    }
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        
//        sender.isSelected = !sender.isSelected
//        tweet.favorited = sender.isSelected
//        
//        print("in like")
//        if (tweet.favorited)! {
//            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
//                if let  error = error {
//                    print("Error unfavoriting tweet: \(error.localizedDescription)")
//                } else if let tweet = tweet {
//                    print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
//                    self.tweet.favoriteCount! += 1
//                    self.likeCountLabel.text = String(tweet.favoriteCount!)
//                }
//            }
//        } else {
//            
//            APIManager.shared.unfavorite(tweet) { (tweet: Tweet?, error: Error?) in
//                if let  error = error {
//                    print("Error favoriting tweet: \(error.localizedDescription)")
//                } else if let tweet = tweet {
//                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
//                    self.tweet.favoriteCount! -= 1
//                    self.likeCountLabel.text = String(tweet.favoriteCount!)
//                }
//            }
//            
//        }
        
    }
    
}
