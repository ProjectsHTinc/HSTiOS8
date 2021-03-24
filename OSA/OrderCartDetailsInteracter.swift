//
//  OrderCartDetailsInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 24/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol OrderCartDetailsBusinessLogic
{
    func fetchItems(request:OrderCartDetailsModel.Fetch.Request)
}
protocol OrderCartDetailsDataStore
{
  
}

class OrderCartDetailsInteractor: OrderCartDetailsBusinessLogic,OrderCartDetailsDataStore
{

    var presenter: OrderCartDetailsPresentationLogic?
    var worker: OrderCartDetailsWorker?
    var respData = [OrderCartDetailsModels]()
    func fetchItems(request: OrderCartDetailsModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp: OrderCartDetailsModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = OrderCartDetailsWorker()
        worker!.fetch(user_id:request.user_id!,order_id:request.order_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: OrderCartDetailsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: OrderCartDetailsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

