//
//  CartModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 04/03/21.
//

import Foundation

class AddToCartModels {
    
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

class CartListModels : NSObject {
    
    var category_name : String?
    var status : String?
    var color_name : String?
    var total_amount : String?
    var product_cover_img : String?
    var price : String?
    var color_code : String?
    var size : String?
    var stocks_left : String?
    var product_description : String?
    var product_id : String?
    var product_name : String?
    var id : String?
    var quantity : String?
   
     // MARK: Instance Method
     func loadFromDictionary(_ dict: [String: AnyObject])
     {
        if let data = dict["category_name"] as? String {
             self.category_name = data
        }
        if let data = dict["status"] as? String {
            self.status = data
        }
        if let data = dict["color_name"] as? String {
            self.color_name = data
        }
        if let data = dict["total_amount"] as? String {
            self.total_amount = data
        }
        if let data = dict["quantity"] as? String {
            self.quantity = data
        }
        
        
        if let data = dict["product_cover_img"] as? String {
             self.product_cover_img = data
        }
        if let data = dict["price"] as? String {
            self.price = data
        }
        if let data = dict["color_code"] as? String {
            self.color_code = data
        }
        if let data = dict["size"] as? String {
            self.size = data
        }
        
        if let data = dict["stocks_left"] as? String {
            self.stocks_left = data
       }
       if let data = dict["product_description"] as? String {
           self.product_description = data
       }
       if let data = dict["product_id"] as? String {
           self.product_id = data
       }
       if let data = dict["product_name"] as? String {
           self.product_name = data
       }
        if let data = dict["id"] as? String {
            self.id = data
        }
        
    }
    class func build(_ dict: [String: AnyObject]) -> CartListModels {
        let model = CartListModels()
        model.loadFromDictionary(dict)
        return model
    }
}


class DeleteCartModels {
    
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

class QuantityUpdateModels {
    
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
