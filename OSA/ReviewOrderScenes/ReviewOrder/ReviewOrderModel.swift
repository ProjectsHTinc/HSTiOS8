//
//  ReviewOrderModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 15/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

struct ReviewOrderModel{
        struct Fetch {
            
            struct Request
            {
                var user_id : String?
                var order_id: String?
            }
            
            struct Response
            {
                var testObj: [ReviewOrderModels]
                var isError: Bool
                var message: String?
            }

            struct ViewModel
            {
               struct DisplayedReviewOrderData
               {
                var product_cover_img : String?
                var category_name : String?
                var total_amount : String?
                var product_id : String?
                var product_description : String?
                var quantity : String?
               
                
                }
                  var displayedReviewOrderData: [DisplayedReviewOrderData]
        
            }
        }
    }
