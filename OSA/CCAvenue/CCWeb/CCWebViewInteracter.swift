//
//  WebViewInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 13/03/21.
//
//
//import Foundation
//
//protocol CCWebViewBusinessLogic
//{
//    func fetchItems(request:CCWebViewModel.Fetch.Request)
//}
//protocol CCWebViewDataStore
//{
//  
//}
//
//class CCWebViewInteractor: CCWebViewBusinessLogic,CCWebViewDataStore
//{
//
//    var presenter: CCWebViewPresentationLogic?
//    var worker: CCWebViewWorker?
// 
//    func fetchItems(request: CCWebViewModel.Fetch.Request) {
//        if request.purchse_order_id == nil {
//           self.presenter?.presentFetchResults(resp: CCWebViewModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
//        }
//        worker = CCWebViewWorker()
//        worker!.fetch(promo_code_id:request.purchse_order_id!,user_id:request.user_id!, purchse_order_id:request.promo_code!, onSuccess: { (resp) in
//            self.presenter?.presentFetchResults(resp: CCWebViewModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
//        }) { (errorMessage) in
//            self.presenter?.presentFetchResults(resp: CCWebViewModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
//        }
//    }
//}
