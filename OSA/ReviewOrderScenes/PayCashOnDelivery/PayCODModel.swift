//
//  PayCODModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 23/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

struct PayCODModel {
    
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var order_id : String?
           
        }
        
        struct Response
        {
            var testObj: PayCODModels?
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
