//
//  ReletedProductsModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 03/03/21.
//

import Foundation
import UIKit

struct RelatedProductModel{
    struct Fetch {
        
        struct Request
        {
            var product_id : String?
            
        }
        
        struct Response
        {
            var testObj: [RelatedProductModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedRelatedProductData
           {
            var product_name : String?
            var product_cover_img : String?
            var product_description : String?
            var offer_percentage : String?
            var review_average : String?
            var prod_mrp_price : String?
            var offer_status : String?
            var stocks_left : String?
            var prod_actual_price : String?
            
            
            }
              var displayedRelatedProductData: [DisplayedRelatedProductData]
    
        }
    }
}
