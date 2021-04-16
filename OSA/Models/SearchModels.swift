//
//  RecentSearchModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 30/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

class SearchListModels : NSObject {
    
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
    var review_average : String?
    var wishlisted : String?
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
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
       if let data = dict["id"] as? String {
            self.id = data
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
       if let data = dict["combined_status"] as? String {
           self.combined_status = data
       }
       if let data = dict["id"] as? String {
            self.id = data
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
       if let data = dict["id"] as? String {
            self.id = data
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
       if let data = dict["product_meta_desc"] as? String {
           self.product_meta_desc = data
       }
       if let data = dict["product_meta_keywords"] as? String {
            self.product_meta_keywords = data
       }
       if let data = dict["stocks_left"] as? String {
            self.stocks_left = data
        }
       if let data = dict["wishlisted"] as? String {
            self.wishlisted = data
        }
       if let data = dict["review_average"] as? String {
             self.review_average = data
         }
      }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> SearchListModels {
         let model = SearchListModels()
         model.loadFromDictionary(dict)
         return model
     }
}

class RecentSearchListModels{
        
    var created_at : String?
    var search_text : String?
    var id : String?
    
        // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["id"] as? String {
        self.id = data
        }
        
        if let data = dict["search_text"] as? String {
        self.search_text = data
        }
        
        if let data = dict["created_at"] as? String {
        self.created_at = data
        }
    }
        
    class func build(_ dict: [String: AnyObject]) -> RecentSearchListModels {
        let model = RecentSearchListModels()
        model.loadFromDictionary(dict)
        return model
    }
}
