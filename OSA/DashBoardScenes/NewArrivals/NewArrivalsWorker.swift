//
//  NewArrivalsWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 23/02/21.
//

import Foundation
import UIKit

typealias NewArrivalsresponseHandler = (_ response:NewArrivalsModel.Fetch.Response) ->()

class NewArrivalsWorker{
    
   var respData = [NewArrivalsDetailModels]()
   func fetch(user_id:String, onSuccess successCallback:(NewArrivalsresponseHandler)?,onFailure failureCallback: @escaping(NewArrivalsresponseHandler)) {
       let manager = APIManager()
       manager.callAPINewArrivalsDetails(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(NewArrivalsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(NewArrivalsModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

