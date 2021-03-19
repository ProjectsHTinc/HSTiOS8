//
//  ProfileUpdateInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 18/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation

protocol ProfileUpdateBusinessLogic
{
    func fetchItems(request:ProfileUpdateModel.Fetch.Request)
}
protocol ProfileUpdateDataStore
{
  
}
          
class ProfileUpdateInteractor: ProfileUpdateBusinessLogic,ProfileUpdateDataStore
{

    var presenter: ProfileUpdatePresentationLogic?
    var worker: ProfileUpdateWorker?
 
    func fetchItems(request: ProfileUpdateModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp: ProfileUpdateModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = ProfileUpdateWorker()
        worker!.fetch(email: request.email!, user_id:request.user_id!,
                      phone_number:request.phone_number!, gender:request.gender!,
                      dob:request.dob!, newsletter_status:request.newsletter_status!,
                      first_name:request.first_name!, last_name:request.last_name!,onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: ProfileUpdateModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: ProfileUpdateModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}
