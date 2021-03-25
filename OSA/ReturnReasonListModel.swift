//
//  ReturnReasonListModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 24/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

struct ReturnReasonListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: [ReturnReasonListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedReturnReasonListData
           {
            var id : String?
            var question : String?
            var user_type : String?
            var status : String?
            var created_at : String?
            var updated_at : String?
            
            }
              var displayedReturnReasonListData: [DisplayedReturnReasonListData]
    
        }
    }
}
