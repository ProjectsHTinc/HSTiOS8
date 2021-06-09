//
//  DeliveredOrdersInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 22/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//


import Foundation

protocol DeliveredOrdersBusinessLogic
{
    func fetchItems(request:DeliveredOrdersModel.Fetch.Request)
}
protocol DeliveredOrdersDataStore
{
  
}

class DeliveredOrdersInteractor: DeliveredOrdersBusinessLogic,DeliveredOrdersDataStore
{

    var presenter1: DeliveredOrdersPresentationLogic?
    var worker: DeliveredOrdersWorker?
    var respData = [DeliveredOrdersModels]()
    func fetchItems(request: DeliveredOrdersModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter1?.presentFetchResults(resp: DeliveredOrdersModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = DeliveredOrdersWorker()
        worker!.fetch(user_id:request.user_id!,status:request.status!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: DeliveredOrdersModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: DeliveredOrdersModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
