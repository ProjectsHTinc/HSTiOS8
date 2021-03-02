//
//  NewArrivalsInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 23/02/21.
//


import Foundation
import UIKit

protocol NewArrivalsBusinessLogic
{
    func fetchItems(request: NewArrivalsModel.Fetch.Request)
}

protocol NewArrivalsDataStore
{
  
}

class NewArrivalsInteractor: NewArrivalsBusinessLogic, NewArrivalsDataStore
{
    var presenter3: NewArrivalsPresentationLogic?
    var worker: NewArrivalsWorker?
    var respData = [NewArrivalsDetailModels]()
    func fetchItems(request: NewArrivalsModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter3?.presentFetchResults(resp: NewArrivalsModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
        }
        worker = NewArrivalsWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter3?.presentFetchResults(resp: NewArrivalsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter3?.presentFetchResults(resp: NewArrivalsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
