//
//  PlaceOrderWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//

import Foundation
import UIKit

typealias PlaceOrderresponseHandler = (_ response:PlaceOrderModel.Fetch.Response) ->()

class PlaceOrderWorker{

   func fetch(cus_notes:String,user_id:String,address_id:String, onSuccess successCallback:(PlaceOrderresponseHandler)?,onFailure failureCallback: @escaping(PlaceOrderresponseHandler)) {
       let manager = APIManager()
       manager.callAPIPlaceOrder(
        address_id:address_id,cus_notes:cus_notes, user_id:user_id, onSuccess: { (resp)  in
               successCallback?(PlaceOrderModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(PlaceOrderModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}
