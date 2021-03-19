//
//  WishListAddWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 19/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//


import Foundation
import UIKit

typealias WishListAddresponseHandler = (_ response:WishListAddModel.Fetch.Response) ->()

class WishListAddWorker{

   func fetch(product_id:String,user_id:String, onSuccess successCallback:(WishListAddresponseHandler)?,onFailure failureCallback: @escaping(WishListAddresponseHandler)) {
       let manager = APIManager()
       manager.callAPIWishListAdd(
        product_id:product_id,user_id:user_id, onSuccess: { (resp)  in
               successCallback?(WishListAddModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(WishListAddModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

