//
//  OrderCartDetailsModels.swift
//  OSA
//
//  Created by Happy Sanz Tech on 24/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//


import Foundation
import UIKit

struct OrderCartDetailsModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var order_id : String?
        }
        
        struct Response
        {
            var testObj: [OrderCartDetailsModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedOrderCartDetailsData
           {
            var quantity : String?
            var price : String?
//            var size : String?
//            var color_name : String?
            var product_cover_img : String?
            var product_id : String?
            var id : String?
            var product_name : String?
            
            }
              var displayedOrderCartDetailsData: [DisplayedOrderCartDetailsData]
    
        }
    }
}
