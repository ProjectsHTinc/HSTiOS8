//
//  PayCODWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 23/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

typealias PayCODresponseHandler = (_ response:PayCODModel.Fetch.Response) ->()

class PayCODWorker{

   func fetch(order_id:String,user_id:String, onSuccess successCallback:(PayCODresponseHandler)?,onFailure failureCallback: @escaping(PayCODresponseHandler)) {
       let manager = APIManager()
       manager.callAPIPayCOD(
        order_id:order_id, user_id:user_id, onSuccess: { (resp)  in
               successCallback?(PayCODModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(PayCODModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}
