//
//  GoogleIntegrationModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 07/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

struct GoogleIntegrationModel{
    struct Fetch {
        
        struct Request
        {
            var email : String?
            var first_name : String?
            var last_name : String?
            var mobile_type : String?
            var mob_key : String?
            var login_type : String?
            var login_portal : String?
        }
       
        struct Response
        {
            var testObj: GoogleIntegrationModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var status : String?
            var address_id : String?
            var birth_date : String?
            var customer_id : String?
            var first_name : String?
            var last_login : String?
            var last_name : String?
            var newsletter_status : String?
            var phone_number : String?
            var profile_picture : String?
            var email : String?
            var isError: Bool
            var message: String?
        }
    }
}

