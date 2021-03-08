//
//  CartDeleteInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/03/21.
//
import Foundation

protocol DeleteCartBusinessLogic
{
    func fetchItems(request:DeleteCartModel.Fetch.Request)
}
protocol DeleteCartDataStore
{
  
}

class DeleteCartInteractor: DeleteCartBusinessLogic,DeleteCartDataStore
{

    var presenter1: DeleteCartPresentationLogic?
    var worker: DeleteCartWorker?
 
    func fetchItems(request: DeleteCartModel.Fetch.Request) {
        if request.cart_id == nil {
           self.presenter1?.presentFetchResults(resp: DeleteCartModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = DeleteCartWorker()
        worker!.fetch(cart_id:request.cart_id!,user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: DeleteCartModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: DeleteCartModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

