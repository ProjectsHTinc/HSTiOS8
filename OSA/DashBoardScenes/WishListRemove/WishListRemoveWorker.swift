//
//  WishListRemoveWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 19/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//


import Foundation
import UIKit

typealias WishListDeleteresponseHandler = (_ response: WishListDeleteModel.Fetch.Response) ->()

class WishListDeleteWorker{

   func fetch(product_id:String,user_id:String, onSuccess successCallback:(WishListDeleteresponseHandler)?,onFailure failureCallback: @escaping(WishListDeleteresponseHandler)) {
       let manager = APIManager()
       manager.callAPIWishListDelete(
        product_id:product_id,user_id:user_id, onSuccess: { (resp)  in
               successCallback?(WishListDeleteModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(WishListDeleteModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}

