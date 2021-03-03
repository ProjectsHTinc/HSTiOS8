//
//  DashBoardModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 17/02/21.
//

import Foundation
import UIKit

struct DashBoardModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: [DashBoardDetailModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedDashBoardData
           {
            var id : String?
            var banner_title : String?
            var banner_desc : String?
            var banner_image : String?
            var product_id : String?
            }
              var displayedDashBoardData: [DisplayedDashBoardData]

        }
    }
}
