//
//  ProductsModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 27/02/21.
//

import Foundation

class ProductDetailsModels {
    
    var id : String?
    var product_name : String?
    var sku_code: String?
    var product_cover_img : String?
    var prod_size_chart : String?
    var product_description: String?
    var prod_actual_price : String?
    var prod_mrp_price : String?
    var offer_percentage: String?
    var product_meta_title : String?
    var product_meta_desc : String?
    var stocks_left: String?
    var product_review: String?
    
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
        if let data = dict["product_description"] as? String {
            self.product_description = data
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
        if let data = dict["product_meta_title"] as? String {
            self.product_meta_title = data
        }
        if let data = dict["product_meta_desc"] as? String {
            self.product_meta_desc = data
        }
        if let data = dict["stocks_left"] as? String {
            self.stocks_left = data
        }
        if let data = dict["average"] as? String {
            self.product_review = data
        }
    }
}

class ProductSizeModels : NSObject {
    
    var id : String?
    var product_id : String?
    var mas_size_id : String?
    var size : String?
    var prod_actual_price : String?
    var prod_mrp_price : String?
    var prod_default : String?
    var stocks_left : String?
    
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
        if let data = dict["id"] as? String {
             self.id = data
        }
        if let data = dict["product_id"] as? String {
            self.product_id = data
        }
        if let data = dict["mas_size_id"] as? String {
            self.mas_size_id = data
        }
        if let data = dict["size"] as? String {
            self.size = data
        }
        if let data = dict["prod_mrp_price"] as? String {
            self.prod_mrp_price = data
        }
        if let data = dict["prod_actual_price"] as? String {
            self.prod_actual_price = data
        }
        if let data = dict["prod_default"] as? String {
           self.prod_default = data
        }
        if let data = dict["stocks_left"] as? String {
           self.stocks_left = data
        }
    }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> ProductSizeModels {
         let model = ProductSizeModels()
         model.loadFromDictionary(dict)
         return model
     }
}

class ProductColourModels : NSObject {
    
    var id : String?
    var product_id : String?
    var mas_color_id : String?
    var color_name : String?
    var color_code : String?
    var prod_mrp_price : String?
    var prod_default : String?
    var stocks_left : String?
    var prod_actual_price : String?
    
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
        if let data = dict["id"] as? String {
             self.id = data
        }
        if let data = dict["product_id"] as? String {
            self.product_id = data
        }
        if let data = dict["mas_color_id"] as? String {
            self.mas_color_id = data
        }
        if let data = dict["color_name"] as? String {
            self.color_name = data
        }
        if let data = dict["color_code"] as? String {
            self.color_code = data
        }
        if let data = dict["prod_actual_price"] as? String {
            self.prod_actual_price = data
        }
        if let data = dict["prod_default"] as? String {
           self.prod_default = data
        }
        if let data = dict["stocks_left"] as? String {
           self.stocks_left = data
        }
        if let data = dict["prod_mrp_price"] as? String {
           self.prod_mrp_price = data
        }
    }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> ProductColourModels {
         let model = ProductColourModels()
         model.loadFromDictionary(dict)
         return model
     }
}

class RelatedProductModels : NSObject {
    
    var product_name : String?
    var product_cover_img : String?
    var product_description : String?
    var offer_percentage : String?
//    var review_average : String?
    var prod_mrp_price : String?
    var offer_status : String?
    var stocks_left : String?
    var prod_actual_price : String?
    
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
        if let data = dict["product_name"] as? String {
             self.product_name = data
        }
        if let data = dict["product_cover_img"] as? String {
            self.product_cover_img = data
        }
        if let data = dict["product_description"] as? String {
            self.product_description = data
        }
        if let data = dict["offer_status"] as? String {
            self.offer_status = data
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
        if let data = dict["stocks_left"] as? String {
           self.stocks_left = data
        }
      
    }
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> RelatedProductModels {
         let model = RelatedProductModels()
         model.loadFromDictionary(dict)
         return model
     }
}

class ReviewListModels : NSObject {
    
    var customer_name : String?
    var product_id : String?
    var rating : String?
    var comment : String?
    
    
    
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
        if let data = dict["customer_name"] as? String {
             self.customer_name = data
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
     // MARK: Class Method
     class func build(_ dict: [String: AnyObject]) -> ReviewListModels {
         let model = ReviewListModels()
         model.loadFromDictionary(dict)
         return model
     }
}


class CheckPinCodeModels {
    
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
