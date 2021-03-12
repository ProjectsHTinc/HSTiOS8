//
//  DeleteAddressModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 10/03/21.
//

import Foundation
import UIKit

struct DeleteAddressModel{
    
    struct Fetch {
        
        struct Request
        {
    
            var user_id : String?
            var address_id : String?
        
        }
        
        struct Response
        {
            var testObj: DeleteAddressModels?
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
