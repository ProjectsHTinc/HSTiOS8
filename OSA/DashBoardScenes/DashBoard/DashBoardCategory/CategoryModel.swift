//
//  CategoryModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 22/02/21.
//

import Foundation
import UIKit

struct CategoryModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: [CategoryDetailModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedCategoryData
           {
            var id : String?
            var parent_id : String?
            var category_image : String?
            var category_desc : String?
            var category_name : String?
            }
              var displayedCategoryData: [DisplayedCategoryData]

        }
    }
}

