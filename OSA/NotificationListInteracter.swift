//
//  NotificationListInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 07/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation

protocol NotificationListBusinessLogic
{
    func fetchItems(request:NotificationListModel.Fetch.Request)
}
protocol NotificationListDataStore
{
  
}

class NotificationListInteractor:NotificationListBusinessLogic,NotificationListDataStore
{

    var presenter: NotificationListPresentationLogic?
    var worker: NotificationListWorker?
    var respData = [NotificationListModels]()
    func fetchItems(request: NotificationListModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp: NotificationListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = NotificationListWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: NotificationListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: NotificationListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
