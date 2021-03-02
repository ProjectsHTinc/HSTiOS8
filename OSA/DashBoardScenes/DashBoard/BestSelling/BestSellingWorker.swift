//
//  BestSellingWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 23/02/21.
//

import Foundation
import UIKit

typealias BestSellingresponseHandler = (_ response:BestSellingModel.Fetch.Response) ->()

class BestSellingWorker{
    
   var respData = [BestSellingDetailModels]()
   func fetch(user_id:String, onSuccess successCallback:(BestSellingresponseHandler)?,onFailure failureCallback: @escaping(BestSellingresponseHandler)) {
       let manager = APIManager()
       manager.callAPIBestSellingDetails(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(BestSellingModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(BestSellingModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

