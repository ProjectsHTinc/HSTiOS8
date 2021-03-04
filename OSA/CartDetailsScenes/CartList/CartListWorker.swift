//
//  CartListWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 04/03/21.
//

import Foundation
import UIKit

typealias CartListresponseHandler = (_ response:CartListModel.Fetch.Response) ->()

class CartListWorker{
    
   var respData = [CartListModels]()
    func fetch(user_id:String, onSuccess successCallback:(CartListresponseHandler)?,onFailure failureCallback: @escaping(CartListresponseHandler)) {
       let manager = APIManager()
       manager.callAPICartList(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(CartListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(CartListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
