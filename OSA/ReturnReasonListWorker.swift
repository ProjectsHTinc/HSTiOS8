//
//  ReturnReasonListWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 24/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

typealias ReturnReasonListresponseHandler = (_ response:ReturnReasonListModel.Fetch.Response) ->()

class ReturnReasonListWorker{
    
    var respData = [ReturnReasonListModels]()
    
   func fetch(user_id:String, onSuccess successCallback:(ReturnReasonListresponseHandler)?,onFailure failureCallback: @escaping(ReturnReasonListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIReturnReasonList(
        user_id:user_id ,onSuccess: { (resp)  in
               successCallback?(ReturnReasonListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ReturnReasonListModel.Fetch.Response(testObj: self.respData, isError: true, message:nil))
           }
       )
   }
}

