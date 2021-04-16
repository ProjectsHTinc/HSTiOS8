//
//  ListFilterModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 01/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//


import Foundation
import UIKit

struct ListFilterModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var cat_id : String?
            var sub_cat_id : String?
            
        }
        
        struct Response
        {
            var testObj: [ListFilterModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedListFilterData
           {
            var id : String?
            var parent_id : String?
            var category_name : String?
            var category_image : String?
            var category_thumbnail : String?
            var category_desc : String?
            var category_meta_title : String?
            var category_meta_desc : String?
            var category_keywords : String?
            var status : String?
            var created_at : String?
            var created_by : String?
            var updated_at : String?
            var updated_by : String?
           
            
            }
              var displayedListFilterData: [DisplayedListFilterData]
    
        }
    }
}

