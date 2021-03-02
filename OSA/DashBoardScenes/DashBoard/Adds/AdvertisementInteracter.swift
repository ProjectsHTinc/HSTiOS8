//
//  AdvertisementInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 23/02/21.
//

import Foundation
import UIKit

protocol AdvertisementBusinessLogic
{
    func fetchItems(request: AdvertisementModel.Fetch.Request)
}

protocol AdvertisementDataStore
{
  
}

class AdvertisementInteractor: AdvertisementBusinessLogic, AdvertisementDataStore
{
    var presenter4: AdvertisementPresentationLogic?
    var worker: AdvertisementWorker?
    var respData = [AdvertisementDetailModels]()
    func fetchItems(request: AdvertisementModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter4?.presentFetchResults(resp: AdvertisementModel.Fetch.Response(testObj: respData, isError:true, message: "emptyy" ))
        }
        worker = AdvertisementWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter4?.presentFetchResults(resp: AdvertisementModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter4?.presentFetchResults(resp: AdvertisementModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
