//
//  AddtoCartPresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 04/03/21.
//

import Foundation

protocol AddToCartPresentationLogic
{
  func presentFetchResults(resp: AddToCartModel.Fetch.Response)
}

class AddToCartPresenter: AddToCartPresentationLogic
{
  weak var viewController5: AddToCartDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: AddToCartModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = AddToCartModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController5?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController5?.successFetchedItems(viewModel: viewModel)
        }
    }
}

