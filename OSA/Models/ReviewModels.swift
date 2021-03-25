//
//  ReviewModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

class AddReviewModels {
    
    var msg : String?
    var status : String?
       
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["msg"] as? String {
            self.msg = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
    }
}

class CheckReviewModels {
    
    var msg : String?
    var status : String?
    var id : String?
    var product_id : String?
    var rating : String?
    var comment : String?
    
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["msg"] as? String {
            self.msg = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["id"] as? String {
            self.id = data
        }
        if let data = dict["product_id"] as? String {
            self.product_id = data
        }
        if let data = dict["rating"] as? String {
            self.rating = data
        }
        if let data = dict["comment"] as? String {
            self.comment = data
        }
    }
}

class UpdateReviewModels {
    
    var msg : String?
    var status : String?
       
    // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["msg"] as? String {
            self.msg = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
    }
}

