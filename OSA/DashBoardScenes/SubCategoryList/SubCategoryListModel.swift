//
//  SubCategoryListModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 26/02/21.
//

import Foundation

struct SubCategoryListModel{
    struct Fetch {
        
        struct Request
        {
            var cat_id : String?
            var sub_cat_id : String?
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: [SubCategoryListDetailModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedSubCategoryListData
           {
            var id : String?
            var prod_mrp_price : String?
            var stocks_left : String?
            var product_cover_img : String?
            var product_meta_desc : String?
            var wishlisted : String?
            var product_name : String?
            var delivery_fee_status : String?
            var product_description : String?
            var product_meta_keywords : String?
            var review_average : String?
            
            }
            var displayedSubCategoryListData: [DisplayedSubCategoryListData]
        }
    }
}
