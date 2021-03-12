//
//  AddAddressInteracter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 10/03/21.
//

import Foundation

protocol AddAddressBusinessLogic
{
    func fetchItems(request:AddAddressModel.Fetch.Request)
}
protocol AddAddressDataStore
{
  
}

class AddAddressInteractor: AddAddressBusinessLogic,AddAddressDataStore
{

    var presenter: AddAddressPresentationLogic?
    var worker: AddAddressWorker?
 
    func fetchItems(request: AddAddressModel.Fetch.Request) {
        if request.user_id == nil {
           self.presenter?.presentFetchResults(resp: AddAddressModel.Fetch.Response(testObj: nil, isError:true, message: "emptyyy" ))
        }
        worker = AddAddressWorker()
        worker!.fetch(user_id:request.user_id!,country_id:request.country_id!,state:request.state!,city:request.city!,pincode:request.pincode!,house_no:request.house_no!,street:request.street!,landmark:request.landmark!,full_name:request.full_name!,mobile_number:request.mobile_number!,email_address:request.email_address!,alternative_mobile_number:request.alternative_mobile_number!,address_type:request.address_type!, onSuccess: { (resp) in
            self.presenter?.presentFetchResults(resp: AddAddressModel.Fetch.Response(testObj: resp.testObj, isError: false, message: nil))
        }) { (errorMessage) in
            self.presenter?.presentFetchResults(resp: AddAddressModel.Fetch.Response(testObj: errorMessage.testObj, isError: true, message: "An error Occured"))
        }
    }
}

