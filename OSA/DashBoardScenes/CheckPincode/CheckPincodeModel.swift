//
//  CheckPincodeModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/03/21.
//
import Foundation
import UIKit

struct CheckPincodeModel{
    struct Fetch {
        
        struct Request
        {
          
            var pin_code : String?
        }
        
        struct Response
        {
            var testObj: CheckPinCodeModels?
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
