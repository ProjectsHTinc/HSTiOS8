//
//  ReviewOrderModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 15/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

class ReviewOrderModels{
        
    var product_cover_img : String?
    var category_name : String?
    var total_amount : String?
    var product_id : String?
    var product_description : String?
    var quantity : String?
   
        
        // MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
    {
        if let data = dict["product_cover_img"] as? String {
        self.product_cover_img = data
        }
        
        if let data = dict["category_name"] as? String {
        self.category_name = data
        }
        
        if let data = dict["total_amount"] as? String {
        self.total_amount = data
        }
        
        if let data = dict["product_id"] as? String {
        self.product_id = data
        }
        if let data = dict["product_description"] as? String {
        self.product_description = data
        }
        
        if let data = dict["quantity"] as? String {
        self.quantity = data
        }
    }
        
    class func build(_ dict: [String: AnyObject]) -> ReviewOrderModels {
        let model = ReviewOrderModels()
        model.loadFromDictionary(dict)
        return model
    }
}
//
//"cart_items" : [
//  {
//    "status" : "Success",
//    "id" : "41",
//    "stocks_left" : "100",
//    "color_name" : " ",
//    "color_code" : " ",
//    "product_name" : "Muslin Swaddle",
//    "quantity" : "1",
//    "size" : " ",
//    "product_cover_img" : "https:\/\/happysanztech.com\/shopping\/assets\/products\/CH_1609234360.jpg",
//    "category_name" : "Muslin Essential",
//    "total_amount" : "1.00",
//    "price" : "1.00",
//    "product_id" : "1",
//    "product_description" : "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500"
//  }
//],
