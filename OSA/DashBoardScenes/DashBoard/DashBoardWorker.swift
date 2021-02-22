//
//  DashBoardWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 17/02/21.
//

import Foundation
import UIKit

typealias DashBoardresponseHandler = (_ response:DashBoardModel.Fetch.Response) ->()

class DashBoardWorker{
    
   var respData = [DashBoardDetailModels]()
   func fetch(user_id:String, onSuccess successCallback:(DashBoardresponseHandler)?,onFailure failureCallback: @escaping(DashBoardresponseHandler)) {
       let manager = APIManager()
       manager.callAPIDasboardDetails(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(DashBoardModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(DashBoardModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

