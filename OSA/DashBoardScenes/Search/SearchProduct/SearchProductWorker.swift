//
//  SearchProductWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 30/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

typealias SearchListresponseHandler = (_ response:SearchListModel.Fetch.Response) ->()

class SearchListWorker{
    
   var respData = [SearchListModels]()
   func fetch(user_id:String,search_name:String, onSuccess successCallback:(SearchListresponseHandler)?,onFailure failureCallback: @escaping(SearchListresponseHandler)) {
       let manager = APIManager()
       manager.callAPISearchList(
        user_id:user_id,search_name:search_name, onSuccess: { (resp)  in
               successCallback?(SearchListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(SearchListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

