//
//  WishListWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 19/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

typealias WishListresponseHandler = (_ response:WishListModel.Fetch.Response) ->()

class WishListWorker{
    
   var respData = [WishListModels]()
   func fetch(user_id:String, onSuccess successCallback:(WishListresponseHandler)?,onFailure failureCallback: @escaping(WishListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIWishList(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(WishListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(WishListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

