//
//  WishListModels.swift
//  OSA
//
//  Created by HappysanziMac on 15/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation


class WishListAddModels {
    
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

class WishListDeleteModels {
    
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


class WishListModels : NSObject {
    
    var id : String?
    var product_name : String?
    var sku_code : String?
    var product_cover_img : String?
    var prod_size_chart : String?
    var product_description : String?
    var offer_status : String?
    var specification_status : String?
    var combined_status : String?
    var prod_actual_price : String?
    var prod_mrp_price : String?
    var offer_percentage : String?
    var delivery_fee_status : String?
    var prod_return_policy : String?
    var prod_cod : String?
    var product_meta_title : String?
    var product_meta_desc : String?
    var product_meta_keywords : String?
    var stocks_left : String?
  
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
        if let data = dict["product_meta_title"] as? String {
             self.product_meta_title = data
        }
        if let data = dict["product_meta_desc"] as? String {
            self.product_meta_desc = data
        }
        if let data = dict["product_meta_keywords"] as? String {
            self.product_meta_keywords = data
        }
        if let data = dict["stocks_left"] as? String {
            self.stocks_left = data
        }
        if let data = dict["prod_cod"] as? String {
           self.prod_cod = data
        }
        if let data = dict["combined_status"] as? String {
             self.combined_status = data
        }
        if let data = dict["prod_actual_price"] as? String {
            self.prod_actual_price = data
        }
        if let data = dict["prod_mrp_price"] as? String {
            self.prod_mrp_price = data
        }
        if let data = dict["offer_percentage"] as? String {
            self.offer_percentage = data
        }
        if let data = dict["delivery_fee_status"] as? String {
            self.delivery_fee_status = data
        }
        if let data = dict["prod_return_policy"] as? String {
            self.prod_return_policy = data
        }
        if let data = dict["prod_cod"] as? String {
           self.prod_cod = data
        }
        if let data = dict["product_meta_title"] as? String {
           self.product_meta_title = data
        }
        if let data = dict["id"] as? String {
             self.id = data
        }
        if let data = dict["product_name"] as? String {
            self.product_name = data
        }
        if let data = dict["sku_code"] as? String {
            self.sku_code = data
        }
        if let data = dict["product_cover_img"] as? String {
            self.product_cover_img = data
        }
        if let data = dict["prod_size_chart"] as? String {
            self.prod_size_chart = data
        }
        if let data = dict["product_description"] as? String {
            self.product_description = data
        }
        if let data = dict["offer_status"] as? String {
           self.offer_status = data
        }
        if let data = dict["specification_status"] as? String {
           self.specification_status = data
        }
    }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> WishListModels {
         let model = WishListModels()
         model.loadFromDictionary(dict)
         return model
     }
}

