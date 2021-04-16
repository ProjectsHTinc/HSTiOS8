//
//  DasboardModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 18/02/21.
//
//₹
import Foundation
import UIKit

class DashBoardDetailModels : NSObject {
    
    var id : String?
    var banner_title : String?
    var banner_desc : String?
    var banner_image : String?
    var product_id : String?
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
         if let data = dict["id"] as? String {
             self.id = data
         }
        if let data = dict["banner_title"] as? String {
            self.banner_title = data
        }
        if let data = dict["banner_desc"] as? String {
            self.banner_desc = data
        }
        if let data = dict["banner_image"] as? String {
            self.banner_image = data
        }
        if let data = dict["product_id"] as? String {
            self.product_id = data
        }
     }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> DashBoardDetailModels {
         let model = DashBoardDetailModels()
         model.loadFromDictionary(dict)
         return model
     }
    
}

class CategoryDetailModels : NSObject {
    
    var id : String?
    var parent_id : String?
    var category_image : String?
    var category_desc : String?
    var category_name : String?
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
         if let data = dict["id"] as? String {
             self.id = data
         }

        if let data = dict["parent_id"] as? String {
            self.parent_id = data
        }
        
        if let data = dict["category_image"] as? String {
            self.category_image = data
        }
        
        if let data = dict["category_desc"] as? String {
            self.category_desc = data
        }
        if let data = dict["category_name"] as? String {
            self.category_name = data
        }
     }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> CategoryDetailModels {
         let model = CategoryDetailModels()
         model.loadFromDictionary(dict)
         return model
     }
}

class BestSellingDetailModels : NSObject {
    
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
       if let data = dict["prod_size_chart"] as? String {
            self.prod_size_chart = data
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
       if let data = dict["review_average"] as? String {
            self.review_average = data
        }
       if let data = dict["wishlisted"] as? String {
            self.wishlisted = data
        }
      }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> BestSellingDetailModels {
         let model = BestSellingDetailModels()
         model.loadFromDictionary(dict)
         return model
     }
}

class NewArrivalsDetailModels : NSObject {
    
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
       if let data = dict["prod_size_chart"] as? String {
            self.prod_size_chart = data
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
       if let data = dict["review_average"] as? String {
            self.review_average = data
        }
       if let data = dict["wishlisted"] as? String {
            self.wishlisted = data
        }
      }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> NewArrivalsDetailModels {
         let model = NewArrivalsDetailModels()
         model.loadFromDictionary(dict)
         return model
     }
}

class AdvertisementDetailModels : NSObject {
    
    var id : String?
    var ad_title : String?
    var sub_cat_id : String?
    var ad_img : String?
    
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
       if let data = dict["id"] as? String {
             self.id = data
       }
       if let data = dict["ad_title"] as? String {
        self.ad_title = data
       }
       if let data = dict["sub_cat_id"] as? String {
            self.sub_cat_id = data
       }
       if let data = dict["ad_img"] as? String {
            self.ad_img = data
       }
       
      }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> AdvertisementDetailModels {
         let model = AdvertisementDetailModels()
         model.loadFromDictionary(dict)
         return model
     }
}
