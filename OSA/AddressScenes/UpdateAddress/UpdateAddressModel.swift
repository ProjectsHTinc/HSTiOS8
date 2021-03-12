//
//  UpdateAddressModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 10/03/21.
//

import Foundation
import UIKit

struct UpdateAddressModel{
    
    struct Fetch {
        
        struct Request
        {
    
            var user_id : String?
            var country_id : String?
            var state : String?
            var city : String?
            var pincode : String?
            var house_no : String?
            var street : String?
            var landmark : String?
            var full_name : String?
            var mobile_number : String?
            var email_address : String?
            var alternative_mobile_number : String?
            var address_type : String?
            var address_id : String?
            var status : String?
          
        }
        
        struct Response
        {
            var testObj: UpdateAddressModels?
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
