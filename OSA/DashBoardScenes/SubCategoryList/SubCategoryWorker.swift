//
//  SubCategoryWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 26/02/21.
//

import Foundation
import UIKit

typealias SubCategoryListresponseHandler = (_ response:SubCategoryListModel.Fetch.Response) ->()

class SubCategoryListWorker{
    
   var respData = [SubCategoryListDetailModels]()
   func fetch(cat_id:String,user_id:String,sub_cat_id:String, onSuccess successCallback:(SubCategoryListresponseHandler)?,onFailure failureCallback: @escaping(SubCategoryListresponseHandler)) {
       let manager = APIManager()
       manager.callAPISubCategoryListDetails(
        cat_id:cat_id,user_id:user_id, sub_cat_id:sub_cat_id, onSuccess: { (resp)  in
               successCallback?(SubCategoryListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(SubCategoryListModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
   }
}


