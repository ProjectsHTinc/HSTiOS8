//
//  CartQuantityPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//

import Foundation

protocol QuantityUpdatePresentationLogic
{
  func presentFetchResults(resp: QuantityUpdateModel.Fetch.Response)
}

class QuantityUpdatePresenter: QuantityUpdatePresentationLogic
{
  weak var viewController2: QuantityUpdateDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: QuantityUpdateModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = QuantityUpdateModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController2?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController2?.successFetchedItems(viewModel: viewModel)
        }
    }
}


