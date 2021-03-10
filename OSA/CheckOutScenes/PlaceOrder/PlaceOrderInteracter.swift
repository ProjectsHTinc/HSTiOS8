//
//  PlaceOrderInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//

import Foundation

protocol PlaceOrderBusinessLogic
{
    func fetchItems(request:PlaceOrderModel.Fetch.Request)
}
protocol PlaceOrderDataStore
{
  
}

class PlaceOrderInteractor: PlaceOrderBusinessLogic,PlaceOrderDataStore
{

    var presenter2: PlaceOrderPresentationLogic?
    var worker: PlaceOrderWorker?
 
    func fetchItems(request: PlaceOrderModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter2?.presentFetchResults(resp: PlaceOrderModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = PlaceOrderWorker()
        worker!.fetch(cus_notes:request.cus_notes!,user_id:request.user_id!, address_id:request.address_id!, onSuccess: { (resp) in
            self.presenter2?.presentFetchResults(resp: PlaceOrderModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter2?.presentFetchResults(resp: PlaceOrderModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
