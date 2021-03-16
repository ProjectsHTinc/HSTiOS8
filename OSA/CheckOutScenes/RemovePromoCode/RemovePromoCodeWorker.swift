//
//  RemovePromoCodeWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 13/03/21.
//

import Foundation
import UIKit

typealias RemovePromoCoderesponseHandler = (_ response:RemovePromoCodeModel.Fetch.Response) ->()

class RemovePromoCodeWorker{

   func fetch(promo_code_id:String,user_id:String,purchse_order_id:String, onSuccess successCallback:(RemovePromoCoderesponseHandler)?,onFailure failureCallback: @escaping(RemovePromoCoderesponseHandler)) {
       let manager = APIManager()
       manager.callAPIRemovePromoCode(
        promo_code_id:promo_code_id,user_id:user_id, purchse_order_id:purchse_order_id, onSuccess: { (resp)  in
               successCallback?(RemovePromoCodeModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(RemovePromoCodeModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}
