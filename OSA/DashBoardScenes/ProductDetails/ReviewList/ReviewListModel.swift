//
//  ReviewListModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 03/03/21.
//

import Foundation
import UIKit

struct ReviewListModel{
    struct Fetch {
        
        struct Request
        {
            var product_id : String?
            
        }
        
        struct Response
        {
            var testObj: [ReviewListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedReviewListData
           {
            var customer_name : String?
            var product_id : String?
            var rating : String?
            var comment : String?
            
            }
              var displayedReviewListData: [DisplayedReviewListData]
    
        }
    }
}
