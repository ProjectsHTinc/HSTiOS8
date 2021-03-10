//
//  PromoCodeWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//

import Foundation
import UIKit

typealias PromoCoderesponseHandler = (_ response:PromoCodeModel.Fetch.Response) ->()

class PromoCodeWorker{

   func fetch(purchse_order_id:String,user_id:String,promo_code:String, onSuccess successCallback:(PromoCoderesponseHandler)?,onFailure failureCallback: @escaping(PromoCoderesponseHandler)) {
       let manager = APIManager()
       manager.callAPIPromoCode(
        purchse_order_id:purchse_order_id,user_id:user_id,promo_code:promo_code, onSuccess: { (resp)  in
               successCallback?(PromoCodeModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(PromoCodeModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}
