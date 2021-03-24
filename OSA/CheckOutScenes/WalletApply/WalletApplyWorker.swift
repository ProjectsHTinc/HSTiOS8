//
//  WalletApplyWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 22/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

typealias WalletApplyresponseHandler = (_ response:WalletApplyModel.Fetch.Response) ->()

class WalletApplyWorker{

   func fetch(purchse_order_id:String,user_id:String, onSuccess successCallback:(WalletApplyresponseHandler)?,onFailure failureCallback: @escaping(WalletApplyresponseHandler)) {
       let manager = APIManager()
       manager.callAPIWalletApply(
        purchse_order_id:purchse_order_id,user_id:user_id, onSuccess: { (resp)  in
               successCallback?(WalletApplyModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(WalletApplyModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}
