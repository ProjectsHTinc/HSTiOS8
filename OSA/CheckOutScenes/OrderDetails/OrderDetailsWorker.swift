//
//  OrderDetailsWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 09/03/21.
//

import Foundation
import UIKit


typealias OrderDetailsresponseHandler = (_ response:OrderDetailsModel.Fetch.Response) ->()

class OrderDetailsWorker{
    
   var respData = [OrderDetailsModels]()
    func fetch(user_id:String,order_id:String, onSuccess successCallback:(OrderDetailsresponseHandler)?,onFailure failureCallback: @escaping(OrderDetailsresponseHandler)) {
       let manager = APIManager()
       manager.callAPIOrderDetails(
        user_id:user_id, order_id:order_id, onSuccess: { (resp)  in
               successCallback?(OrderDetailsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(OrderDetailsModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

