//
//  AddToCartModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 04/03/21.
//

import Foundation
import UIKit

struct AddToCartModel{
    struct Fetch {
        
        struct Request
        {
            var product_id : String?
            var product_comb_id : String?
            var quantity : String?
            var user_id : String?
        } 
        
        struct Response
        {
            var testObj: AddToCartModels?
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
