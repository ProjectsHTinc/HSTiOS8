//
//  CheckReviewWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation
import UIKit

typealias CheckReviewresponseHandler = (_ response:CheckReviewModel.Fetch.Response) ->()

class CheckReviewWorker{

   func fetch(product_id:String,user_id:String, onSuccess successCallback:(CheckReviewresponseHandler)?,onFailure failureCallback: @escaping(CheckReviewresponseHandler)) {
       let manager = APIManager()
       manager.callAPICheckReview(
        product_id:product_id,user_id:user_id, onSuccess: { (resp)  in
               successCallback?(CheckReviewModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(CheckReviewModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}


