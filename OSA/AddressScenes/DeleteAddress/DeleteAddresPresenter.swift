//
//  DeleteAddresPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 10/03/21.
//
import Foundation

protocol DeleteAddressPresentationLogic
{
  func presentFetchResults(resp: DeleteAddressModel.Fetch.Response)
}

class DeleteAddressPresenter: DeleteAddressPresentationLogic
{
  weak var viewController1: DeleteAddressDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: DeleteAddressModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = DeleteAddressModel.Fetch.ViewModel(status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController1?.errorFetchingItems(viewModel: viewModel)
        }else
        {
            viewController1?.successFetchedItems(viewModel: viewModel)
        }
    }
}
