//
//  CategoryWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 22/02/21.
//


import Foundation
import UIKit

typealias CategoryresponseHandler = (_ response:CategoryModel.Fetch.Response) ->()

class CategoryWorker{
    
   var respData = [CategoryDetailModels]()
   func fetch(user_id:String, onSuccess successCallback:(CategoryresponseHandler)?,onFailure failureCallback: @escaping(CategoryresponseHandler)) {
       let manager = APIManager()
       manager.callAPICategoryDetails(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(CategoryModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(CategoryModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}

