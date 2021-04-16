//
//  ColourListWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 01/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

typealias ColourListresponseHandler = (_ response:ColourListModel.Fetch.Response) ->()

class ColourListWorker{
    
   var respData = [ColourListModels]()
    func fetch(user_id:String,cat_id:String,sub_cat_id:String, onSuccess successCallback:(ColourListresponseHandler)?,onFailure failureCallback: @escaping(ColourListresponseHandler)) {
       let manager = APIManager()
       manager.callAPIColourList(
        user_id:user_id,cat_id:cat_id,sub_cat_id:sub_cat_id, onSuccess: { (resp)  in
               successCallback?(ColourListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ColourListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}
