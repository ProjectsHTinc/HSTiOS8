//
//  OrderHistoryModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 22/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

class DeliveredOrdersModels : NSObject {
    
    var total_amount : String?
    var cus_id : String?
    var city : String?
    var alternative_mobile_number : String?
    var house_no : String?
    var cus_notes : String?
    var state : String?
    var status : String?
    var street : String?
    var pincode : String?
    var full_name : String?
    var mobile_number : String?
    var email_address : String?
    var purchase_date : String?
    var id : String?
    var order_status : String?
    var landmark : String?
    var order_cover_img : String?
    var order_id : String?
   
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
        if let data = dict["total_amount"] as? String {
             self.total_amount = data
        }
        if let data = dict["cus_id"] as? String {
            self.cus_id = data
        }
        if let data = dict["city"] as? String {
            self.city = data
        }
        if let data = dict["alternative_mobile_number"] as? String {
            self.alternative_mobile_number = data
        }
        if let data = dict["house_no"] as? String {
            self.house_no = data
        }
        if let data = dict["cus_notes"] as? String {
             self.cus_notes = data
        }
        if let data = dict["state"] as? String {
            self.state = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["street"] as? String {
           self.street = data
        }
        if let data = dict["pincode"] as? String {
           self.pincode = data
        }
        if let data = dict["full_name"] as? String {
            self.full_name = data
        }
        if let data = dict["mobile_number"] as? String {
            self.mobile_number = data
        }
        if let data = dict["email_address"] as? String {
            self.email_address = data
        }
        if let data = dict["purchase_date"] as? String {
           self.purchase_date = data
        }
        if let data = dict["id"] as? String {
           self.id = data
        }
        if let data = dict["order_status"] as? String {
            self.order_status = data
        }
        if let data = dict["landmark"] as? String {
            self.landmark = data
        }
        if let data = dict["order_cover_img"] as? String {
            self.order_cover_img = data
        }
        if let data = dict["order_id"] as? String {
            self.order_id = data
        }
    }
    
     class func build(_ dict: [String: AnyObject]) -> DeliveredOrdersModels {
        let model = DeliveredOrdersModels()
        model.loadFromDictionary(dict)
        return model
     }
}

import Foundation

class OrderCartDetailsModels : NSObject {
    
    var quantity : String?
    var price : String?
    var size : String?
    var color_name : String?
    var product_cover_img : String?
    var product_id : String?
    var id : String?
    var product_name : String?
    
   
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
        if let data = dict["quantity"] as? String {
             self.quantity = data
        }
        if let data = dict["price"] as? String {
            self.price = data
        }
//        if let data = dict["size"] as? String {
//            self.size = data
//        }
//        if let data = dict["color_name"] as? String {
//            self.color_name = data
//        }
        if let data = dict["product_cover_img"] as? String {
            self.product_cover_img = data
        }
        if let data = dict["product_id"] as? String {
             self.product_id = data
        }
        if let data = dict["id"] as? String {
            self.id = data
        }
        if let data = dict["product_name"] as? String {
            self.product_name = data
        }
    }
    
     class func build(_ dict: [String: AnyObject]) -> OrderCartDetailsModels {
        let model = OrderCartDetailsModels()
        model.loadFromDictionary(dict)
        return model
     }
}
