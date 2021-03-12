//
//  WalletDetailsInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/03/21.
//

import Foundation

protocol WalletDetailsBusinessLogic
{
    func fetchItems(request:WalletDetailsModel.Fetch.Request)
}
protocol WalletDetailsDataStore
{
  
}

class WalletDetailsInteractor: WalletDetailsBusinessLogic,WalletDetailsDataStore
{

    var presenter: WalletDetailsPresentationLogic?
    var worker: WalletDetailsWorker?
    var respData = [WalletDetailsModels]()
    func fetchItems(request: WalletDetailsModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp: WalletDetailsModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = WalletDetailsWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: WalletDetailsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: WalletDetailsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
