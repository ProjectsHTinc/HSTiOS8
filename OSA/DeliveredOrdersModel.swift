//
//  DeliveredOrdersModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 22/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation
import UIKit

struct DeliveredOrdersModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
            var status : String?
        }
        
        struct Response
        {
            var testObj: [DeliveredOrdersModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedDeliveredOrdersData
           {
            var total_amount : String?
            var cus_id : String?
            var city : String?
            var alternative_mobile_number : String?
            var house_no : String?
            var cus_notes : String?
            var state : String?
            var status : String?
            var street : String?
            var pincode : String?
            var full_name : String?
            var mobile_number : String?
            var email_address : String?
            var purchase_date : String?
            var id : String?
            var order_status : String?
            var landmark : String?
            var order_cover_img : String?
            var order_id : String?
            }
              var displayedDeliveredOrdersData: [DisplayedDeliveredOrdersData]
    
        }
    }
}
//"order_count" : 1,
//"order_details" : [
//  {
//    "city" : "test town",
//    "total_amount" : "1.00",
//    "pincode" : "641201",
//    "cus_id" : "1",
//    "alternative_mobile_number" : "",
//    "house_no" : "44",
//    "cus_notes" : "",
//    "state" : "test state",
//    "status" : "Active",
//    "street" : "test appart",
//    "order_id" : "SHOP20210323BE64105-8",
//    "full_name" : "Senthil Maran",
//    "mobile_number" : "9942297930",
//    "email_address" : "senmaran@gmail.com",
//    "purchase_date" : "2021-03-23 18:22:50",
//    "id" : "1",
//    "order_status" : "Success",
//    "landmark" : "",
//    "order_cover_img" : "https:\/\/happysanztech.com\/shopping\/assets\/products\/CH_1609234360.jpg"
//  }
//],
//"msg" : "orders found",
//"status" : "success"
