//
//  CartDeleteWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/03/21.
//

import Foundation
import UIKit

typealias DeleteCartresponseHandler = (_ response:DeleteCartModel.Fetch.Response) ->()

class DeleteCartWorker{

   func fetch(cart_id:String,user_id:String, onSuccess successCallback:(DeleteCartresponseHandler)?,onFailure failureCallback: @escaping(DeleteCartresponseHandler)) {
       let manager = APIManager()
       manager.callAPIDeleteCart(
        cart_id:cart_id,user_id:user_id, onSuccess: { (resp)  in
               successCallback?(DeleteCartModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(DeleteCartModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}


