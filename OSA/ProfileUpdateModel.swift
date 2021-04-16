//
//  ProfileUpdateModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 18/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

struct ProfileUpdateModel{
    struct Fetch {
        
        struct Request
        {
            
            var email : String?
            var user_id : String?
            var phone_number : String?
            var gender : String?
            var dob : String?
            var newsletter_status : String?
            var first_name : String?
            var last_name : String?
            
        }
        
        struct Response
        {
            var testObj: ProfileUpdateModels?
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
