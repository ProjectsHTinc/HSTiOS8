//
//  UpdateReviewWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation
import UIKit

typealias UpdateReviewresponseHandler = (_ response:UpdateReviewModel.Fetch.Response) ->()

class UpdateReviewWorker{

   func fetch(product_id:String,user_id:String,review_id:String,comment:String,rating:String, onSuccess successCallback:(UpdateReviewresponseHandler)?,onFailure failureCallback: @escaping(UpdateReviewresponseHandler)) {
       let manager = APIManager()
       manager.callAPIUpdateReview(
        product_id:product_id,user_id:user_id,review_id:review_id,comment:comment,rating:rating, onSuccess: { (resp)  in
               successCallback?(UpdateReviewModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(UpdateReviewModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}



