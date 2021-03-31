//
//  RecentSearchModel.swift
//  OSA
//
//  Created by Happy Sanz Tech on 30/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

import Foundation
import UIKit

struct RecentSearchListModel{
        struct Fetch {
            
            struct Request
            {
                var user_id : String?
            }
            
            struct Response
            {
                var testObj: [RecentSearchListModels]
                var isError: Bool
                var message: String?
            }

            struct ViewModel
            {
               struct DisplayedRecentSearchListData
               {
                var created_at : String?
                var search_text : String?
                var id : String?
              
                }
                  var displayedRecentSearchListData: [DisplayedRecentSearchListData]
        
            }
        }
    }
