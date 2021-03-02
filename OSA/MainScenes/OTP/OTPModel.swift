//
//  OTPModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import Foundation

struct  OTPModel{
    struct Fetch {
        
        struct Request
        {
            var mobile_number : String?
            var OTP : String?
            var mob_key : String?
            var mobile_type : String?
            var login_type : String?
            var login_portal : String?
        }
        
        struct Response
        {
            var testObj: OTPModels?
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

