//
//  CartListModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 04/03/21.
//

import Foundation
import UIKit

struct CartListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            
        }
        
        struct Response
        {
            var testObj: [CartListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedCartListData
           {
            var category_name : String?
            var status : String?
            var color_name : String?
            var total_amount : String?
            var product_cover_img : String?
            var price : String?
            var color_code : String?
            var size : String?
            var stocks_left : String?
            var product_description : String?
            var product_id : String?
            var product_name : String?
            var id : String?
            var quantity : String?
            
            }
              var displayedCartListData: [DisplayedCartListData]
    
        }
    }
}
