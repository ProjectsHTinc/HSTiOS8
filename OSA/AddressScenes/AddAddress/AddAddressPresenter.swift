//
//  AddAddressPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 10/03/21.
//

import Foundation

protocol AddAddressPresentationLogic
{
  func presentFetchResults(resp: AddAddressModel.Fetch.Response)
}

class AddAddressPresenter: AddAddressPresentationLogic
{
  weak var viewController: AddAddressDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: AddAddressModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = AddAddressModel.Fetch.ViewModel(msg: resp.testObj?.msg,status: resp.testObj?.status, address_id: resp.testObj?.address_id, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController?.successFetchedItems(viewModel: viewModel)
        }
    }
}
