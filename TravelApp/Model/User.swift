//
//  Trip.swift
//  TravelApp
//
//  Created by rawat on 28/01/17.
//  Copyright © 2017 Pankaj Rawat. All rights reserved.
//

import UIKit

class User: NSObject {
    var id: NSNumber?
    var name: String?
    var email: String?
    var instagram_access_token: String?
    var instagram_profile_picture: String?
    var instagram_user_name: String?
    var profile_pic: ProfilePic?
    var cover_photo: CoverPic?
    var total_followers: NSNumber?
    var total_following: NSNumber?
    var total_trips: NSNumber?
    var updated_at: String?
    var created_at: String?
    var is_followed_by_current_user: Bool = false
    
    init(dictionary: [String: AnyObject]) {
        super.init()
        
        setValuesForKeys(dictionary)
        
        if let profilePicDict = dictionary["profile_pic"] as! [String: AnyObject]? {
            profile_pic = ProfilePic(dictionary: profilePicDict)
        }
        
        if let coverPhotoDict = dictionary["cover_photo"] as! [String: AnyObject]? {
            cover_photo = CoverPic(dictionary: coverPhotoDict)
        }
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        let _key = key
        
        if (["profile_pic", "cover_photo", "website_url", "blog_url", "facebook_url", "twitter_url", "instagram_url"].contains(_key)) {
            return
        }
        
        super.setValue(value, forKey: _key)
    }
}

class ProfilePic: NSObject {
    var url: String?
    var public_id: String?
    
    init(dictionary: [String: AnyObject]) {
        super.init()
        public_id = dictionary["public_id"] as! String?
        url = dictionary["url"] as! String?
    }
}

class CoverPic: ProfilePic {
}
