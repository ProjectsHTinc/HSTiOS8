//
//  AddToCartInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 04/03/21.
//

import Foundation

protocol AddToCartBusinessLogic
{
    func fetchItems(request:AddToCartModel.Fetch.Request)
}
protocol AddToCartDataStore
{
  
}

class AddToCartInteractor: AddToCartBusinessLogic,AddToCartDataStore
{

    var presenter5: AddToCartPresentationLogic?
    var worker: AddToCartWorker?
 
    func fetchItems(request: AddToCartModel.Fetch.Request) {
        if request.product_id == nil {
           self.presenter5?.presentFetchResults(resp: AddToCartModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = AddToCartWorker()
        worker!.fetch(product_id:request.product_id!,product_comb_id:request.product_comb_id!,quantity:request.quantity!,user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter5?.presentFetchResults(resp: AddToCartModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter5?.presentFetchResults(resp: AddToCartModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

