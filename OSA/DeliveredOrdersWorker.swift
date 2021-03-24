//
//  DeliveredOrdersWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 22/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD


typealias DeliveredOrdersresponseHandler = (_ response:DeliveredOrdersModel.Fetch.Response) ->()

class DeliveredOrdersWorker{
    
    var respData = [DeliveredOrdersModels]()
    
    func fetch(user_id:String,status:String, onSuccess successCallback:(DeliveredOrdersresponseHandler)?,onFailure failureCallback: @escaping(DeliveredOrdersresponseHandler)) {
       let manager = APIManager()
//        MBProgressHUD.showAdded(to: self.view, animated: true)
       manager.callAPIDeliveredOrders(
        user_id:user_id,status:status, onSuccess: { (resp)  in
               successCallback?(DeliveredOrdersModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(DeliveredOrdersModel.Fetch.Response(testObj: self.respData, isError: true, message:nil))
           }
       )
   }
}


