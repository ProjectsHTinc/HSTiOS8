//
//  EmailPasswordModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import Foundation

struct  ForgotPasswordModel{
    struct Fetch {
        
        struct Request
        {
            var email : String?
           
        }
        
        struct Response
        {
            var testObj: ForgotPasswordModels?
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
            var isError: Bool
            var message: String?
        }
    }
}

