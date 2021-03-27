//
//  CheckPasswordModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 26/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation
import UIKit

struct ChangePasswordModel{
    struct Fetch {
        
        struct Request
        {
            
            var user_id : String?
            var password : String?
            
        }
     
        struct Response
        {
            var testObj: ChangePasswordModels?
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
