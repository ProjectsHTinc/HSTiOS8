//
//  WishListInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 19/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation
import UIKit

protocol WishListBusinessLogic
{
    func fetchItems(request: WishListModel.Fetch.Request)
}

protocol WishListDataStore
{
  
}

class WishListInteractor: WishListBusinessLogic, WishListDataStore
{
    var presenter: WishListPresentationLogic?
    var worker: WishListWorker?
    var respData = [WishListModels]()
    func fetchItems(request: WishListModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp: WishListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
        }
        worker = WishListWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: WishListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: WishListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
