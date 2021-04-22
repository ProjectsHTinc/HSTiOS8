//
//  ReturnRequestModel.swift
//  OSA
//
//  Created by HappysanziMac on 22/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

struct ReturnOrderRequestModel{
    
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var purchase_order_id : String?
            var reason_question_id : String?
            var answer_text : String?
            
        }
        
        struct Response
        {
            var testObj: ReturnOrderRequestsModels?
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
