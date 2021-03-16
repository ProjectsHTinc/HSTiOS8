//
//  RemovePromoCodeInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 13/03/21.
//


import Foundation

protocol RemovePromoCodeBusinessLogic
{
    func fetchItems(request:RemovePromoCodeModel.Fetch.Request)
}
protocol RemovePromoCodeDataStore
{
  
}

class RemovePromoCodeInteractor: RemovePromoCodeBusinessLogic,RemovePromoCodeDataStore
{

    var presenter4: RemovePromoCodePresentationLogic?
    var worker: RemovePromoCodeWorker?
 
    func fetchItems(request: RemovePromoCodeModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter4?.presentFetchResults(resp: RemovePromoCodeModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = RemovePromoCodeWorker()
        worker!.fetch(promo_code_id:request.promo_code_id!,user_id:request.user_id!, purchse_order_id:request.purchse_order_id!, onSuccess: { (resp) in
            self.presenter4?.presentFetchResults(resp: RemovePromoCodeModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter4?.presentFetchResults(resp: RemovePromoCodeModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
