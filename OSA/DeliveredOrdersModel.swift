//
//  DeliveredOrdersModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 22/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

struct DeliveredOrdersModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var status : String?
        }
        
        struct Response
        {
            var testObj: [DeliveredOrdersModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedDeliveredOrdersData
           {
            var total_amount : String?
            var cus_id : String?
            var city : String?
            var alternative_mobile_number : String?
            var house_no : String?
            var cus_notes : String?
            var state : String?
            var status : String?
            var street : String?
            var pincode : String?
            var full_name : String?
            var mobile_number : String?
            var email_address : String?
            var purchase_date : String?
            var id : String?
            var order_status : String?
            var landmark : String?
            var order_cover_img : String?
            var order_id : String?
            var promo_amount : String?
            var purchase_order_status : String?
            var paid_amount : String?
            var payment_status : String?
            var country_name : String?
            var wallet_amount : String?
            }
              var displayedDeliveredOrdersData: [DisplayedDeliveredOrdersData]
    
        }
    }
}
