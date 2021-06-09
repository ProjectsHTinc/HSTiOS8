//
//  CategoryModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/02/21.
//

import Foundation

class CategorySelectDetailModels : NSObject {
    
    var id : String?
    var parent_id : String?
    var category_name : String?
    var category_image : String?
    var category_desc : String?
    
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
       if let data = dict["id"] as? String {
             self.id = data
       }
       if let data = dict["parent_id"] as? String {
        self.parent_id = data
       }
       if let data = dict["category_name"] as? String {
            self.category_name = data
       }
       if let data = dict["category_image"] as? String {
            self.category_image = data
       }
       if let data = dict["category_desc"] as? String {
            self.category_desc = data
       }
       
      }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> CategorySelectDetailModels {
         let model = CategorySelectDetailModels()
         model.loadFromDictionary(dict)
         return model
     }
}

class SubCategoryListDetailModels : NSObject {
    
    var id : String?
    var prod_mrp_price : String?
    var stocks_left : String?
    var product_cover_img : String?
    var product_meta_desc : String?
    var wishlisted : String?
    var product_name : String?
    var delivery_fee_status : String?
    var product_description : String?
    var product_meta_keywords : String?
    var review_average : String?
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
       if let data = dict["id"] as? String {
             self.id = data
       }
       if let data = dict["prod_mrp_price"] as? String {
        self.prod_mrp_price = data
       }
       if let data = dict["stocks_left"] as? String {
            self.stocks_left = data
       }
       if let data = dict["product_cover_img"] as? String {
            self.product_cover_img = data
       }
       if let data = dict["product_meta_desc"] as? String {
            self.product_meta_desc = data
       }        
        if let data = dict["wishlisted"] as? String {
              self.wishlisted = data
        }
        if let data = dict["product_name"] as? String {
         self.product_name = data
        }
        if let data = dict["delivery_fee_status"] as? String {
             self.delivery_fee_status = data
        }
        if let data = dict["product_description"] as? String {
             self.product_description = data
        }
        if let data = dict["product_meta_keywords"] as? String {
             self.product_meta_keywords = data
        }
        if let data = dict["review_average"] as? String {
             self.review_average = data
        }
      }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> SubCategoryListDetailModels {
         let model = SubCategoryListDetailModels()
         model.loadFromDictionary(dict)
         return model
     }
}
