//
//  AddressListInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 09/03/21.
//

import Foundation

protocol AddressListBusinessLogic
{
    func fetchItems(request:AddressListModel.Fetch.Request)
}
protocol AddressListDataStore
{
  
}

class AddressListInteractor: AddressListBusinessLogic,AddressListDataStore
{

    var presenter: AddressListPresentationLogic?
    var worker: AddressListWorker?
    var respData = [AddressListModels]()
    func fetchItems(request: AddressListModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp: AddressListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyyy" ))
        }
        worker = AddressListWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: AddressListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: AddressListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
