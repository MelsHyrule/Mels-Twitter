//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation
import AlamofireImage

class User {
    // For user persistance
    var dictionary: [String: Any]?
    private static var _current: User?
    static var current: User? {
        get {
            if _current == nil {
                let defaults = UserDefaults.standard
                if let userData = defaults.data(forKey: "currentUserData") {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! [String: Any]
                    _current = User(dictionary: dictionary)
                }
            }
            return _current
        }
        set (user) {
            _current = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
        }
    }
    
    var name: String?
    var id: Int64?
    var screenName: String?
    var profilePictureURL: URL?
    //var backgroundPictureURL: URL?
    var description: String?
    var following: Int?
    var followers: Int?
    
    init(dictionary: [String: Any]) {
        self.dictionary = dictionary
        
        name = dictionary["name"] as! String
        id = dictionary["id"] as! Int64
        screenName = dictionary["screen_name"] as! String
        profilePictureURL = URL(string: dictionary["profile_image_url_https"] as! String)
        //backgroundPictureURL = URL(string: dictionary["profile_banner_url"] as! String) //profile_banner_url
        description = dictionary["description"] as! String
        following = dictionary["friends_count"] as! Int
        followers = dictionary["followers_count"] as! Int
        
    }
}
