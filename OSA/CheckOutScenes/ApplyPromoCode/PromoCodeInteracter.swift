//
//  PromoCodeInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//
import Foundation

protocol PromoCodeBusinessLogic
{
    func fetchItems(request:PromoCodeModel.Fetch.Request)
}
protocol PromoCodeDataStore
{
  
}

class PromoCodeInteractor: PromoCodeBusinessLogic,PromoCodeDataStore
{

    var presenter1: PromoCodePresentationLogic?
    var worker: PromoCodeWorker?
 
    func fetchItems(request: PromoCodeModel.Fetch.Request) {
        if request.purchse_order_id == nil {
           self.presenter1?.presentFetchResults(resp: PromoCodeModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = PromoCodeWorker()
        worker!.fetch(purchse_order_id:request.purchse_order_id!,user_id:request.user_id!, promo_code:request.promo_code!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: PromoCodeModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: PromoCodeModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
