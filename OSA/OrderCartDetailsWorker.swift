//
//  OrderCartDetailsWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 24/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

typealias OrderCartDetailsresponseHandler = (_ response:OrderCartDetailsModel.Fetch.Response) ->()

class OrderCartDetailsWorker{
    
    var respData = [OrderCartDetailsModels]()
    
   func fetch(user_id:String,order_id:String, onSuccess successCallback:(OrderCartDetailsresponseHandler)?,onFailure failureCallback: @escaping(OrderCartDetailsresponseHandler)) {
       let manager = APIManager()
       manager.callAPIOrderCartDetails(
        user_id:user_id,order_id:order_id, onSuccess: { (resp)  in
               successCallback?(OrderCartDetailsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(OrderCartDetailsModel.Fetch.Response(testObj: self.respData, isError: true, message:nil))
           }
       )
   }
}

