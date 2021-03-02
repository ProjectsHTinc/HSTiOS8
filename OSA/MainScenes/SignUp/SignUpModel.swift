//
//  SignUpModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import Foundation
import UIKit

struct SignupModel{
    struct Fetch {
        
        struct Request
        {
            var name : String?
            var phone : String?
            var email : String?
            var password : String?
        }
        
        struct Response
        {
            var testObj: SignUpModels?
            var isError: Bool
            var message: String?
        }
        
        struct ViewModel
        {
            var status : String?
            var isError: Bool
            var message: String?
        }
    }
}

