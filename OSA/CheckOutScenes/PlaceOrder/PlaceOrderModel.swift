//
//  PlaceOrderModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//

import Foundation
import UIKit

struct PlaceOrderModel{
    
    struct Fetch {
        
        struct Request
        {
            
            var cus_notes : String?
            var user_id : String?
            var address_id : String?
           
        }
        
        struct Response
        {
            var testObj: PlaceOrderModels?
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
