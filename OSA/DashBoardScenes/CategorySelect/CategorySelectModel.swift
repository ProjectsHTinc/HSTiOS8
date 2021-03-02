//
//  CategorySelectModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/02/21.
//

import Foundation

struct CategorySelectModel{
    struct Fetch {
        
        struct Request
        {
            var cat_id : String?
        }
        
        struct Response
        {
            var testObj: [CategorySelectDetailModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedCategorySelectData
           {
            var id : String?
            var category_name : String?
            var parent_id : String?
            var category_image : String?
            var category_desc : String?
            
            }
            var displayedCategorySelectData: [DisplayedCategorySelectData]
        }
    }
}

