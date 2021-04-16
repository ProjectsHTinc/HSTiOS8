//
//  ResultFilterWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 01/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

typealias ResultFilterresponseHandler = (_ response:ResultFilterModel.Fetch.Response) ->()

class ResultFilterWorker{
    
   var respData = [ResultFilterModels]()
    func fetch(user_id:String,cat_id:String,sub_cat_id:String,min_price_range:String,max_price_range:String,product_size_id:String,product_colour_id:String, onSuccess successCallback:(ResultFilterresponseHandler)?,onFailure failureCallback: @escaping(ResultFilterresponseHandler)) {
       let manager = APIManager()
       manager.callAPIResultFilter(
        user_id:user_id,cat_id:cat_id,sub_cat_id:sub_cat_id,min_price_range:min_price_range,max_price_range:max_price_range,product_size_id:product_size_id,product_colour_id:product_colour_id, onSuccess: { (resp)  in
               successCallback?(ResultFilterModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ResultFilterModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
