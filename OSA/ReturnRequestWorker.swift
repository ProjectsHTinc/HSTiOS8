//
//  ReturnRequestWorker.swift
//  OSA
//
//  Created by HappysanziMac on 22/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

typealias ReturnOrderRequestresponseHandler = (_ response:ReturnOrderRequestModel.Fetch.Response) ->()

class ReturnOrderRequestWorker{

   func fetch(user_id:String,purchase_order_id:String,reason_question_id:String,answer_text:String, onSuccess successCallback:(ReturnOrderRequestresponseHandler)?,onFailure failureCallback: @escaping(ReturnOrderRequestresponseHandler)) {
       let manager = APIManager()
       manager.callAPIReturnOrderRequest(
        user_id:user_id, purchase_order_id:purchase_order_id,reason_question_id:reason_question_id, answer_text:answer_text, onSuccess: { (resp)  in
               successCallback?(ReturnOrderRequestModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ReturnOrderRequestModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}
