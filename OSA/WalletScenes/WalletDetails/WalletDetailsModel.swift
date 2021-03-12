//
//  WalletDetailsModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/03/21.
//

import Foundation
import UIKit

struct WalletDetailsModel{
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: [WalletDetailsModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedWalletDetailsData
           {
            var created_at : String?
            var id : String?
            var transaction_amt : String?
            var status : String?
            var created_by : String?
            var customer_id : String?
            var notes : String?
            var order_id : String?
            
            }
              var displayedWalletDetailsData: [DisplayedWalletDetailsData]
    
        }
    }
}
