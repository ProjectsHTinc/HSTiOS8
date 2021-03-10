//
//  AddressListModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 09/03/21.
//

import Foundation
import UIKit

struct AddressListModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: [AddressListModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedAddressListData
           {
            var address_type : String?
            var alternative_mobile_number : String?
            var city : String?
            var email_address : String?
            var full_name : String?
            var house_no : String?
            var id : String?
            var landmark : String?
            var mobile_number : String?
            var pincode : String?
            var product_name : String?
            var state : String?
            var street : String?
            
            }
              var displayedAddressListData: [DisplayedAddressListData]
    
        }
    }
}
