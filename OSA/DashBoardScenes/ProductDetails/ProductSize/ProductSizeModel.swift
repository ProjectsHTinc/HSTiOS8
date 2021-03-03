//
//  ProductSizeModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 02/03/21.
//

import Foundation
import UIKit

struct ProductSizeModel{
    struct Fetch {
        
        struct Request
        {
            var product_id : String?
        }
        
        struct Response
        {
            var testObj: [ProductSizeModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedProductSizeData
           {
            var id : String?
            var product_id : String?
            var mas_size_id : String?
            var size : String?
            var prod_actual_price : String?
            var prod_mrp_price : String?
            var prod_default : String?
            var stocks_left : String?
            
            }
              var displayedProductSizeData: [DisplayedProductSizeData]
    
        }
    }
}
