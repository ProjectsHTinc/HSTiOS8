//
//  OrderDetailsInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 09/03/21.
//

import Foundation


protocol OrderDetailsBusinessLogic
{
    func fetchItems(request: OrderDetailsModel.Fetch.Request)
}
protocol OrderDetailsDataStore
{
  
}

class OrderDetailsInteractor: OrderDetailsBusinessLogic,OrderDetailsDataStore
{
    var presenter3: OrderDetailsPresentationLogic?
    var worker: OrderDetailsWorker?
    var respData = [OrderDetailsModels]()
    func fetchItems(request: OrderDetailsModel.Fetch.Request) {
//        if request.user_id == nil {
//           self.presenter?.presentFetchResults(resp: DashBoardModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
//        }
        worker = OrderDetailsWorker()
        worker!.fetch(user_id:request.user_id!,order_id:request.order_id!, onSuccess: { (resp) in
            self.presenter3?.presentFetchResults(resp: OrderDetailsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter3?.presentFetchResults(resp: OrderDetailsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

