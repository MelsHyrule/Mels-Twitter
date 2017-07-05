//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Melody Ann Seda Marotte on 7/5/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit

protocol ComposeViewControllerDelegate {
    func did(post: Tweet)
}

class ComposeViewController: UIViewController {

    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var userImageView: UIImageView!
    
    var delegate: ComposeViewControllerDelegate?
//    weak var delegate: ComposeViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = User.current
        userImageView.af_setImage(withURL: user!.profilePictureURL!)
        userImageView.layer.cornerRadius = userImageView.frame.size.width/2
        userImageView.layer.masksToBounds = true
        
        tweetTextView.clipsToBounds = true
        tweetTextView.layer.cornerRadius = 10.0
        //tweetTextView.layer.masksToBounds = true
        
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
    
    @IBAction func didTapPost(_ sender: Any) {
        APIManager.shared.composeTweet(with: tweetTextView.text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
            }
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        //clear the text field
        self.dismiss(animated: true, completion: nil)
    }
    

}
