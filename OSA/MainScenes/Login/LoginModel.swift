//
//  LoginModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/02/21.
//

import Foundation
import UIKit

struct LoginModel{
    struct Fetch {
        
        struct Request
        {
            var mobile_number : String?
        }
        
        struct Response
        {
            var testObj: MobileLoginModel?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var OTP : String?
            var status : String?
            var isError: Bool
            var message: String?
        }
    }
}
