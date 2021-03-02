//
//  ProductDetailsModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 27/02/21.
//

import Foundation

struct ProductDetailsModel{
    
    struct Fetch {
        
        struct Request
        {
            var product_id : String?
        }
        
        struct Response
        {
            var testObj: ProductDetailsModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
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
            var isError: Bool
            var message: String?
        }
    }
}
