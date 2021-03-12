//
//  AddressListPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 09/03/21.
//

protocol AddressListPresentationLogic
{
  func presentFetchResults(resp: AddressListModel.Fetch.Response)
}

class AddressListPresenter: AddressListPresentationLogic
{
  weak var viewController: AddressListDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp:AddressListModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        var displayedAddressListData: [AddressListModel.Fetch.ViewModel.DisplayedAddressListData] = []
       
        for data in resp.testObj {
            let displayedAddressListDatas = AddressListModel.Fetch.ViewModel.DisplayedAddressListData(address_type: data.address_type!,alternative_mobile_number: data.alternative_mobile_number!, city: data.city!, email_address: data.email_address!, full_name: data.full_name!, house_no: data.house_no!, id: data.id!, landmark: data.landmark!, mobile_number: data.mobile_number!, pincode: data.pincode!, state: data.state!, street: data.street!, address_mode: data.address_mode!)
            displayedAddressListData.append(displayedAddressListDatas)
        }
        let viewModel = AddressListModel.Fetch.ViewModel(displayedAddressListData: displayedAddressListData)
        viewController?.successFetchedItems(viewModel: viewModel)
    }
}

