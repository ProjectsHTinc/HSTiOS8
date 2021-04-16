//
//  SearchProductModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 30/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//


import Foundation
import UIKit

struct SearchListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var search_name : String?
        }
        
        struct Response
        {
            var testObj: [SearchListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedSearchListData
           {
            var id : String?
            var product_name : String?
            var sku_code : String?
            var product_cover_img : String?
            var product_description : String?
            var offer_status : String?
            var specification_status : String?
            var combined_status : String?
            var prod_actual_price : String?
            var prod_mrp_price : String?
            var offer_percentage : String?
            var delivery_fee_status : String?
            var prod_return_policy : String?
            var prod_cod : String?
            var product_meta_title : String?
            var product_meta_desc : String?
            var product_meta_keywords : String?
            var stocks_left : String?
            var wishlisted : String?
            var review_average : String?
            }
            var displayedSearchListData: [DisplayedSearchListData]

        }
    }
}

