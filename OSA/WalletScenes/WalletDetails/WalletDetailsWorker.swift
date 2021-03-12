//
//  WalletDetailsWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/03/21.
//
import Foundation
import UIKit

typealias WalletDetailsresponseHandler = (_ response:WalletDetailsModel.Fetch.Response) ->()

class WalletDetailsWorker{
    
    var respData = [WalletDetailsModels]()
    
   func fetch(user_id:String, onSuccess successCallback:(WalletDetailsresponseHandler)?,onFailure failureCallback: @escaping(WalletDetailsresponseHandler)) {
       let manager = APIManager()
       manager.callAPIWalletDetails(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(WalletDetailsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(WalletDetailsModel.Fetch.Response(testObj: self.respData, isError: true, message:nil))
           }
       )
   }
}

