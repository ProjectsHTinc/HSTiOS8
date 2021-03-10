//
//  PromoCodeModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//

import Foundation
import UIKit

struct PromoCodeModel{
    struct Fetch {
        
        struct Request
        {
            
            var purchse_order_id : String?
            var user_id : String?
            var promo_code : String?
           
        }
        
        struct Response
        {
            var testObj: PromoCodeModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var msg : String?
            var status : String?
            var isError: Bool
            var message: String?
        }
    }
}
