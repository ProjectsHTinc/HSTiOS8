//
//  AddMoneyToWalletInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/03/21.
//
import Foundation

protocol AddMoneyToWalletBusinessLogic
{
    func fetchItems(request:AddMoneyToWalletModel.Fetch.Request)
}
protocol AddMoneyToWalletDataStore
{
  
}
          
class AddMoneyToWalletInteractor: AddMoneyToWalletBusinessLogic,AddMoneyToWalletDataStore
{

    var presenter: AddMoneyToWalletPresentationLogic?
    var worker: AddMoneyToWalletWorker?
 
    func fetchItems(request: AddMoneyToWalletModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp: AddMoneyToWalletModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = AddMoneyToWalletWorker()
        worker!.fetch(user_id:request.user_id!, amount:request.amount!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: AddMoneyToWalletModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: AddMoneyToWalletModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
