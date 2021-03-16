//
//  RemovePromoCodeModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 13/03/21.
//

import Foundation
import UIKit

struct RemovePromoCodeModel{
    
    struct Fetch {
        
        struct Request
        {
            var promo_code_id : String?
            var user_id : String?
            var purchse_order_id : String?
        }
        
        struct Response
        {
            var testObj: RemovePromoCodeModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var msg : String?
            var status : String?
            var order_id : String?
            var isError: Bool
            var message: String?
        }
    }
}
