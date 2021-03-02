//
//  AdvertisementWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 23/02/21.
//


import Foundation
import UIKit

typealias AdvertisementresponseHandler = (_ response:AdvertisementModel.Fetch.Response) ->()

class AdvertisementWorker{
    
   var respData = [AdvertisementDetailModels]()
   func fetch(user_id:String, onSuccess successCallback:(AdvertisementresponseHandler)?,onFailure failureCallback: @escaping(AdvertisementresponseHandler)) {
       let manager = APIManager()
       manager.callAPIAdvertisementDetails(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(AdvertisementModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(AdvertisementModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

