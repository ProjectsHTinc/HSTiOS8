//
//  DeliveryAddressWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//

import Foundation
import UIKit

typealias DeliveryAddressresponseHandler = (_ response:DeliveryAddressModel.Fetch.Response) ->()

class DeliveryAddressWorker{
    
    var respData = [DeliveryAddressModels]()
    
   func fetch(user_id:String, onSuccess successCallback:(DeliveryAddressresponseHandler)?,onFailure failureCallback: @escaping(DeliveryAddressresponseHandler)) {
       let manager = APIManager()
       manager.callAPIDeliveryAddress(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(DeliveryAddressModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(DeliveryAddressModel.Fetch.Response(testObj: self.respData, isError: true, message:nil))
           }
       )
   }
}

