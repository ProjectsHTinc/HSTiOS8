//
//  RecentSearchInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 30/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import Foundation

protocol RecentSearchListBusinessLogic
{
    func fetchItems(request: RecentSearchListModel.Fetch.Request)
}
protocol RecentSearchListDataStore
{
  
}

class RecentSearchListInteractor: RecentSearchListBusinessLogic,RecentSearchListDataStore
{
    var presenter: RecentSearchListPresentationLogic?
    var worker: RecentSearchListWorker?
    var respData = [RecentSearchListModels]()
    func fetchItems(request: RecentSearchListModel.Fetch.Request) {
//        if request.user_id == nil {
//           self.presenter?.presentFetchResults(resp: DashBoardModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
//        }
        worker = RecentSearchListWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: RecentSearchListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: RecentSearchListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

