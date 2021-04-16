//
//  RecentSearchWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 30/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

typealias RecentSearchListresponseHandler = (_ response:RecentSearchListModel.Fetch.Response) ->()

class RecentSearchListWorker{
    
   var respData = [RecentSearchListModels]()
    func fetch(user_id:String, onSuccess successCallback:(RecentSearchListresponseHandler)?,onFailure failureCallback: @escaping(RecentSearchListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIRecentSearchList(
         user_id:user_id, onSuccess: { (resp)  in
               successCallback?(RecentSearchListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                failureCallback(RecentSearchListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
