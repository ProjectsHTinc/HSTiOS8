//
//  CartQuantityModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//

import Foundation
import UIKit

struct QuantityUpdateModel{
    struct Fetch {
        
        struct Request
        {
            
            var cart_id : String?
            var user_id : String?
            var cart_quantity : String?
        }
        
        struct Response
        {
            var testObj: QuantityUpdateModels?
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
