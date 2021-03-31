//
//  SearchProductInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 30/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation
import UIKit

protocol SearchListBusinessLogic
{
    func fetchItems(request: SearchListModel.Fetch.Request)
}

protocol SearchListDataStore
{
  
}

class SearchListInteractor: SearchListBusinessLogic, SearchListDataStore
{
    var presenter2: SearchListPresentationLogic?
    var worker: SearchListWorker?
    var respData = [SearchListModels]()
    func fetchItems(request: SearchListModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter2?.presentFetchResults(resp: SearchListModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
        }
        worker = SearchListWorker()
        worker!.fetch(user_id:request.user_id!,search_name:request.search_name!, onSuccess: { (resp) in
            self.presenter2?.presentFetchResults(resp: SearchListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter2?.presentFetchResults(resp: SearchListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
