//
//  CartQuantityInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//
import Foundation

protocol QuantityUpdateBusinessLogic
{
    func fetchItems(request:QuantityUpdateModel.Fetch.Request)
}
protocol QuantityUpdateDataStore
{
  
}

class QuantityUpdateInteractor: QuantityUpdateBusinessLogic,QuantityUpdateDataStore
{

    var presenter2: QuantityUpdatePresentationLogic?
    var worker: QuantityUpdateWorker?
 
    func fetchItems(request: QuantityUpdateModel.Fetch.Request) {
        if request.cart_id == nil {
           self.presenter2?.presentFetchResults(resp: QuantityUpdateModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = QuantityUpdateWorker()
        worker!.fetch(cart_id:request.cart_id!,user_id:request.user_id!,cart_quantity:request.cart_quantity!, onSuccess: { (resp) in
            self.presenter2?.presentFetchResults(resp: QuantityUpdateModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter2?.presentFetchResults(resp: QuantityUpdateModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
