//
//  AddReviewWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation
import UIKit

typealias AddReviewresponseHandler = (_ response:AddReviewModel.Fetch.Response) ->()

class AddReviewWorker{

   func fetch(product_id:String,user_id:String,comment:String,rating:String, onSuccess successCallback:(AddReviewresponseHandler)?,onFailure failureCallback: @escaping(AddReviewresponseHandler)) {
       let manager = APIManager()
       manager.callAPIAddReview(
        product_id:product_id,user_id:user_id,comment:comment,rating:rating, onSuccess: { (resp)  in
               successCallback?(AddReviewModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(AddReviewModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}


