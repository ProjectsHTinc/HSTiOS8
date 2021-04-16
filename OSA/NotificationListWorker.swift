//
//  NotificationListWorker.swift
//  OSA
//
//  Created by Happy Sanz Tech on 07/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//import Foundation
import UIKit

typealias NotificationListresponseHandler = (_ response:NotificationListModel.Fetch.Response) ->()

class NotificationListWorker{
    
    var respData = [NotificationListModels]()
    
   func fetch(user_id:String, onSuccess successCallback:(NotificationListresponseHandler)?,onFailure failureCallback: @escaping(NotificationListresponseHandler)) {
       let manager = APIManager()
       manager.callAPINotificationList(
        user_id:user_id, onSuccess: { (resp)  in
               successCallback?(NotificationListModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(NotificationListModel.Fetch.Response(testObj: self.respData, isError: true, message:nil))
           }
       )
   }
}

