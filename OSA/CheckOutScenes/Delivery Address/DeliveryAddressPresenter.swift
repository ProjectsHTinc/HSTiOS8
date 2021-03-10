//
//  DeliveryAddressPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//


protocol DeliveryAddressPresentationLogic
{
  func presentFetchResults(resp: DeliveryAddressModel.Fetch.Response)
}

class DeliveryAddressPresenter: DeliveryAddressPresentationLogic
{
  weak var viewController: DeliveryAddressDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:DeliveryAddressModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedDeliveryAddressData: [DeliveryAddressModel.Fetch.ViewModel.DisplayedDeliveryAddressData] = []
       
        for data in resp.testObj {
            let displayedDeliveryAddressDatas = DeliveryAddressModel.Fetch.ViewModel.DisplayedDeliveryAddressData(address_type: data.address_type!,alternative_mobile_number: data.alternative_mobile_number!,city: data.city!,email_address: data.email_address!,full_name: data.full_name!,house_no: data.house_no!,id: data.id!,landmark: data.landmark!,mobile_number: data.mobile_number!,pincode: data.pincode!,state: data.state!,street: data.street!)
            displayedDeliveryAddressData.append(displayedDeliveryAddressDatas)
        }
        let viewModel = DeliveryAddressModel.Fetch.ViewModel(displayedDeliveryAddressData: displayedDeliveryAddressData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}
