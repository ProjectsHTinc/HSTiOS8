//
//  ColourListInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 01/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//


import Foundation
import UIKit

protocol ColourListBusinessLogic
{
    func fetchItems(request: ColourListModel.Fetch.Request)
}
protocol ColourListDataStore
{
  
}

class ColourListInteractor: ColourListBusinessLogic,ColourListDataStore
{
    var presenter3: ColourListPresentationLogic?
    var worker: ColourListWorker?
    var respData = [ColourListModels]()
    func fetchItems(request: ColourListModel.Fetch.Request) {
//        if request.user_id == nil {
//           self.presenter?.presentFetchResults(resp: DashBoardModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
//        }
        worker = ColourListWorker()
        worker!.fetch(user_id:request.user_id!,cat_id:request.cat_id!,sub_cat_id:request.sub_cat_id!, onSuccess: { (resp) in
            self.presenter3?.presentFetchResults(resp: ColourListModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter3?.presentFetchResults(resp: ColourListModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
