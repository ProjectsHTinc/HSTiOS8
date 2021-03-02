//
//  CategorySelectWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/02/21.
//

import Foundation
import UIKit

typealias CategorySelectresponseHandler = (_ response:CategorySelectModel.Fetch.Response) ->()

class CategorySelectWorker{
    
   var respData = [CategorySelectDetailModels]()
   func fetch(cat_id:String, onSuccess successCallback:(CategorySelectresponseHandler)?,onFailure failureCallback: @escaping(CategorySelectresponseHandler)) {
       let manager = APIManager()
       manager.callAPICategorySelectDetails(
        cat_id:cat_id, onSuccess: { (resp)  in
               successCallback?(CategorySelectModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(CategorySelectModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

