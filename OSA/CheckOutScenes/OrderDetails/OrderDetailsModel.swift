//
//  OrderDetailsModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 09/03/21.
//

import Foundation
import UIKit

struct OrderDetailsModel{
        struct Fetch {
            
            struct Request
            {
                var user_id : String?
                var order_id: String?
            }
            
            struct Response
            {
                var testObj: [OrderDetailsModels]
                var isError: Bool
                var message: String?
            }

            struct ViewModel
            {
               struct DisplayedOrderDetailsData
               {
                var promo_amount : String?
                var paid_amount : String?
                var total_amount : String?
                var wallet_amount : String?
                
                }
                  var displayedOrderDetailsData: [DisplayedOrderDetailsData]
        
            }
        }
    }
