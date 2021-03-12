//
//  DefaultAddressPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 10/03/21.
//

import Foundation

protocol DefaultAddressPresentationLogic
{
  func presentFetchResults(resp: DefaultAddressModel.Fetch.Response)
}

class DefaultAddressPresenter: DefaultAddressPresentationLogic
{
  weak var viewController3: DefaultAddressDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: DefaultAddressModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = DefaultAddressModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status,isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController3?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController3?.successFetchedItems(viewModel: viewModel)
        }
    }
}
