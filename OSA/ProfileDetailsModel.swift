//
//  ProfileDetailsModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 18/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation
import UIKit

struct ProfileDetailsModel{
    struct Fetch {
        
        struct Request
        {
        
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: ProfileDetailsModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var first_name : String?
            var profile_picture : String?
            var gender : String?
            var email : String?
            var newsletter_status : String?
            var birth_date : String?
            var id : String?
            var last_name : String?
            var phone_number : String?
            var isError: Bool
            var message: String?
        }
    }
}
