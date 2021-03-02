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
    }
}
