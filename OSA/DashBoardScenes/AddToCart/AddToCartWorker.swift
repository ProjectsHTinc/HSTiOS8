//
//  AddToCartWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 04/03/21.
//

import Foundation
import UIKit

typealias AddToCartresponseHandler = (_ response:AddToCartModel.Fetch.Response) ->()

class AddToCartWorker{

   func fetch(product_id:String,product_comb_id:String,quantity:String,user_id:String, onSuccess successCallback:(AddToCartresponseHandler)?,onFailure failureCallback: @escaping(AddToCartresponseHandler)) {
       let manager = APIManager()
       manager.callAPIAddToCart(
        product_id:product_id,product_comb_id:product_comb_id,quantity:quantity,user_id:user_id, onSuccess: { (resp)  in
               successCallback?(AddToCartModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(AddToCartModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}


