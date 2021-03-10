//
//  AddressListWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 09/03/21.
//

import Foundation
import UIKit

typealias AddressListresponseHandler = (_ response:AddressListModel.Fetch.Response) ->()

class AddressListWorker{
    
    var respData = [AddressListModels]()
    
   func fetch(user_id:String, onSuccess successCallback:(AddressListresponseHandler)?,onFailure failureCallback: @escaping(AddressListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIAddressList(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(AddressListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(AddressListModel.Fetch.Response(testObj: self.respData, isError: true, message:nil))
           }
       )
   }
}

