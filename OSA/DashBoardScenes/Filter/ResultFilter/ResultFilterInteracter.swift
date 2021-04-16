//
//  ResultFilterInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 01/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//


import Foundation
import UIKit

protocol ResultFilterBusinessLogic
{
    func fetchItems(request: ResultFilterModel.Fetch.Request)
}
protocol ResultFilterDataStore
{
  
}

class ResultFilterInteractor: ResultFilterBusinessLogic,ResultFilterDataStore
{
    var presenter4: ResultFilterPresentationLogic?
    var worker: ResultFilterWorker?
    var respData = [ResultFilterModels]()
    func fetchItems(request: ResultFilterModel.Fetch.Request) {
//        if request.user_id == nil {
//           self.presenter?.presentFetchResults(resp: DashBoardModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
//        }
        worker = ResultFilterWorker()
        worker!.fetch(user_id:request.user_id!,cat_id:request.cat_id!,sub_cat_id:request.sub_cat_id!,min_price_range:request.min_price_range!,max_price_range:request.max_price_range!,product_size_id:request.product_size_id!,product_colour_id:request.product_colour_id!, onSuccess: { (resp) in
            self.presenter4?.presentFetchResults(resp: ResultFilterModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter4?.presentFetchResults(resp: ResultFilterModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

