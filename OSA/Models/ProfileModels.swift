//
//  ProfileModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 18/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

class ProfileUpdateModels {
    
    var msg : String?
    var status : String?
    var order_id : String?
    var amount : String?
   
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["msg"] as? String {
            self.msg = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["order_id"] as? String {
            self.order_id = data
        }
        if let data = dict["amount"] as? String {
            self.amount = data
        }
    }
}

class ProfileDetailsModels {
    
    var first_name : String?
    var profile_picture : String?
    var gender : String?
    var email : String?
    var newsletter_status : String?
    var birth_date : String?
    var id : String?
    var last_name : String?
    var phone_number : String?
   
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["first_name"] as? String {
            self.first_name = data
        }
        if let data = dict["profile_picture"] as? String {
            self.profile_picture = data
        }
        if let data = dict["gender"] as? String {
            self.gender = data
        }
        if let data = dict["email"] as? String {
            self.email = data
        }
        if let data = dict["newsletter_status"] as? String {
            self.newsletter_status = data
        }
        if let data = dict["birth_date"] as? String {
            self.birth_date = data
        }
        if let data = dict["id"] as? String {
            self.id = data
        }
        if let data = dict["last_name"] as? String {
            self.last_name = data
        }
        if let data = dict["amount"] as? String {
            self.phone_number = data
        }
    }
}
