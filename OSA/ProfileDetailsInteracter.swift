//
//  ProfileDetailsInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 18/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation

protocol ProfileDetailsBusinessLogic
{
    func fetchItems(request:ProfileDetailsModel.Fetch.Request)
}
protocol ProfileDetailsDataStore
{
  
}
          
class ProfileDetailsInteractor: ProfileDetailsBusinessLogic,ProfileDetailsDataStore
{

    var presenter1: ProfileDetailsPresentationLogic?
    var worker: ProfileDetailsWorker?
 
    func fetchItems(request: ProfileDetailsModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter1?.presentFetchResults(resp: ProfileDetailsModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = ProfileDetailsWorker()
        worker!.fetch(user_id:request.user_id!, onSuccess: { (resp) in
            self.presenter1?.presentFetchResults(resp: ProfileDetailsModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter1?.presentFetchResults(resp: ProfileDetailsModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
