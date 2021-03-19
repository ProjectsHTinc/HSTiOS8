//
//  WishListRemoveModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 19/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

struct WishListDeleteModel{
    struct Fetch {
        
        struct Request
        {
            var product_id : String?
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: WishListDeleteModels?
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
