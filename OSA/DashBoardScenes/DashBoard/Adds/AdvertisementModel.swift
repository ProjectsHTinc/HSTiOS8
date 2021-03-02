//
//  AdvertisementModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 23/02/21.
//

import Foundation
import UIKit

struct AdvertisementModel{
    
    struct Fetch {
        
        struct Request
        {
            var user_id : String?
        }
        
        struct Response
        {
            var testObj: [AdvertisementDetailModels]
            var isError: Bool
            var message: String?
        }

        struct ViewModel
        {
           struct DisplayedAdvertisementData
           {
            var id : String?
            var ad_title : String?
            var sub_cat_id : String?
            var ad_img : String?
            
            }
            var displayedAdvertisementData: [DisplayedAdvertisementData]

        }
    }
}

