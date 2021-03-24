//
//  WalletApplyInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 22/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation

protocol WalletApplyBusinessLogic
{
    func fetchItems(request:WalletApplyModel.Fetch.Request)
}
protocol WalletApplyDataStore
{
  
}

class WalletApplyInteractor: WalletApplyBusinessLogic,WalletApplyDataStore
{

    var presenter5: WalletApplyPresentationLogic?
    var worker: WalletApplyWorker?
 
    func fetchItems(request: WalletApplyModel.Fetch.Request) {
        if request.purchse_order_id == nil {
           self.presenter5?.presentFetchResults(resp: WalletApplyModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = WalletApplyWorker()
        worker!.fetch(purchse_order_id:request.purchse_order_id!,user_id:request.user_id!,onSuccess: { (resp) in
            self.presenter5?.presentFetchResults(resp: WalletApplyModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter5?.presentFetchResults(resp: WalletApplyModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
