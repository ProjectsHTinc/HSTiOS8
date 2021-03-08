//
//  CartDeleteModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/03/21.
//


import Foundation
import UIKit

struct DeleteCartModel{
    struct Fetch {
        
        struct Request
        {
            
            var cart_id : String?
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: DeleteCartModels?
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
