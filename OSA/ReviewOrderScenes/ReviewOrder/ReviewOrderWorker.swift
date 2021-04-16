//
//  ReviewOrderWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 15/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//


import Foundation
import UIKit


typealias ReviewOrderresponseHandler = (_ response:ReviewOrderModel.Fetch.Response) ->()

class ReviewOrderWorker{
    
   var respData = [ReviewOrderModels]()
    func fetch(user_id:String,order_id:String, onSuccess successCallback:(ReviewOrderresponseHandler)?,onFailure failureCallback: @escaping(ReviewOrderresponseHandler)) {
       let manager = APIManager()
       manager.callAPIReviewOrder(
        user_id:user_id, order_id:order_id, onSuccess: { (resp)  in
               successCallback?(ReviewOrderModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ReviewOrderModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

