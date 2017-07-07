//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Melody Ann Seda Marotte on 7/6/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class ProfileViewController: UIViewController {

    var user: User = User.current!
    
    @IBOutlet weak var profileBackgroundImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var followingCounerLabel: UILabel!
    @IBOutlet weak var followersCounterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileBackgroundImageView.af_setImage(withURL: user.backgroundPictureURL!)
 
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
        profileImageView.layer.masksToBounds = true
        profileImageView.af_setImage(withURL: user.profilePictureURL!)
        
        screenNameLabel.text = user.name
        usernameLabel.text = "@" + user.screenName!
        bioLabel.text = user.description
        followingCounerLabel.text = String(user.following!)
        followersCounterLabel.text = String(user.followers!)
        
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

}
