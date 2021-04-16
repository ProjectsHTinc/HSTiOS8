//
//  SizeListWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 01/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

typealias SizeListresponseHandler = (_ response:SizeListModel.Fetch.Response) ->()

class SizeListWorker{
    
   var respData = [SizeListModels]()
    func fetch(user_id:String,cat_id:String,sub_cat_id:String, onSuccess successCallback:(SizeListresponseHandler)?,onFailure failureCallback: @escaping(SizeListresponseHandler)) {
       let manager = APIManager()
       manager.callAPISizeList(
        user_id:user_id,cat_id:cat_id,sub_cat_id:sub_cat_id, onSuccess: { (resp)  in
               successCallback?(SizeListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(SizeListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
