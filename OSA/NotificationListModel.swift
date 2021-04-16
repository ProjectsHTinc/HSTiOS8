//
//  NotificationListModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 07/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation
import UIKit

struct NotificationListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: [NotificationListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedNotificationListData
           {
            var offer_percentage : String?
            var id : String?
            var prod_actual_price : String?
            var prod_mrp_price : String?
            var product_cover_img : String?
            var product_name : String?
            var review_average : String?
            var wishlisted : String?
            var product_meta_desc : String?
            var product_description : String?
           
            
            }
              var displayedNotificationListData: [DisplayedNotificationListData]
    
        }
    }
}
