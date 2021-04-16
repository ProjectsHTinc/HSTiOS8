//
//  NotificationModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 07/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

class NotificationListModels : NSObject {
    
    var offer_percentage : String?
    var id : String?
    var prod_actual_price : String?
    var prod_mrp_price : String?
    var product_cover_img : String?
    var product_name : String?
    var review_average : String?
    var wishlisted : String?
    var product_meta_desc : String?
    var product_description : String?
   
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
        if let data = dict["offer_percentage"] as? String {
             self.offer_percentage = data
        }
        if let data = dict["id"] as? String {
            self.id = data
        }
        if let data = dict["prod_actual_price"] as? String {
            self.prod_actual_price = data
        }
        if let data = dict["product_cover_img"] as? String {
            self.product_cover_img = data
        }
        if let data = dict["prod_mrp_price"] as? String {
            self.prod_mrp_price = data
        }
        if let data = dict["product_name"] as? String {
             self.product_name = data
        }
        if let data = dict["review_average"] as? String {
            self.review_average = data
        }
        if let data = dict["wishlisted"] as? String {
            self.wishlisted = data
        }
        if let data = dict["product_meta_desc"] as? String {
            self.product_meta_desc = data
        }
        if let data = dict["product_description"] as? String {
            self.product_description = data
        }
    }
    
    class func build(_ dict: [String: AnyObject]) -> NotificationListModels {
       let model = NotificationListModels()
       model.loadFromDictionary(dict)
       return model
    }
}
