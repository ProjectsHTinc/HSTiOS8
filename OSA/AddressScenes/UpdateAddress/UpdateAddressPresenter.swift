//
//  UpdateAddressPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 10/03/21.
//

import Foundation

protocol UpdateAddressPresentationLogic
{
  func presentFetchResults(resp: UpdateAddressModel.Fetch.Response)
}

class UpdateAddressPresenter:UpdateAddressPresentationLogic
{
  weak var viewController2: UpdateAddressDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: UpdateAddressModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = UpdateAddressModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status,order_id: resp.testObj?.order_id, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController2?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController2?.successFetchedItems(viewModel: viewModel)
        }
    }
}
