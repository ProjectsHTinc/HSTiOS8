//
//  CartDeletePresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/03/21.
//

import Foundation

protocol DeleteCartPresentationLogic
{
  func presentFetchResults(resp: DeleteCartModel.Fetch.Response)
}

class DeleteCartPresenter: DeleteCartPresentationLogic
{
  weak var viewController1: DeleteCartDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: DeleteCartModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = DeleteCartModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController1?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController1?.successFetchedItems(viewModel: viewModel)
        }
    }
}

