//
//  AddMoneyToWalletWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/03/21.
//

import Foundation
import UIKit

typealias AddMoneyToWalletresponseHandler = (_ response:AddMoneyToWalletModel.Fetch.Response) ->()

class AddMoneyToWalletWorker{

   func fetch(user_id:String,amount:String, onSuccess successCallback:(AddMoneyToWalletresponseHandler)?,onFailure failureCallback: @escaping(AddMoneyToWalletresponseHandler)) {
       let manager = APIManager()
       manager.callAPIAddMoneyToWallet(
        user_id:user_id, amount:amount, onSuccess: { (resp)  in
               successCallback?(AddMoneyToWalletModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(AddMoneyToWalletModel.Fetch.Response(testObj: nil, isError: true, message:nil))
           }
       )
   }
}
