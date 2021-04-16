//
//  ColourListModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 01/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

struct ColourListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var cat_id : String?
            var sub_cat_id : String?
            
        }
        
        struct Response
        {
            var testObj: [ColourListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedColourListData
           {
            var sub_cat_id : String?
            var cat_id : String?
            var mas_color_id : String?
            var attribute_value : String?
            var attribute_name : String?
            
           
            
            }
              var displayedColourListData: [DisplayedColourListData]
    
        }
    }
}

