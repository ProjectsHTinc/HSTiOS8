//
//  CartListInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 04/03/21.
//

import Foundation
import UIKit

protocol CartListBusinessLogic
{
    func fetchItems(request: CartListModel.Fetch.Request)
}
protocol CartListDataStore
{
  
}

class CartListInteractor: CartListBusinessLogic,CartListDataStore
{
    var presenter: CartListPresentationLogic?
    var worker: CartListWorker?
    var respData = [CartListModels]()
    func fetchItems(request: CartListModel.Fetch.Request) {
//        if request.user_id == nil {
//           self.presenter?.presentFetchResults(resp: DashBoardModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
//        }
        worker = CartListWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: CartListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: CartListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
