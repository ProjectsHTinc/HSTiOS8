//
//  CartQuantityWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//

import Foundation
import UIKit

typealias QuantityUpdateresponseHandler = (_ response:QuantityUpdateModel.Fetch.Response) ->()

class QuantityUpdateWorker{

   func fetch(cart_id:String,user_id:String,cart_quantity:String, onSuccess successCallback:(QuantityUpdateresponseHandler)?,onFailure failureCallback: @escaping(QuantityUpdateresponseHandler)) {
       let manager = APIManager()
       manager.callAPIQuantityUpdate(
        cart_id:cart_id,user_id:user_id,cart_quantity:cart_quantity, onSuccess: { (resp)  in
               successCallback?(QuantityUpdateModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(QuantityUpdateModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

