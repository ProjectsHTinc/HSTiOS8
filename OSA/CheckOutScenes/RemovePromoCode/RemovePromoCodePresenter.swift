//
//  RemovePromoCodePresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 13/03/21.
//

import Foundation

protocol RemovePromoCodePresentationLogic
{
  func presentFetchResults(resp: RemovePromoCodeModel.Fetch.Response)
}

class RemovePromoCodePresenter: RemovePromoCodePresentationLogic
{
  weak var viewController4: RemovePromoCodeDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: RemovePromoCodeModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = RemovePromoCodeModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status,order_id: resp.testObj?.order_id, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController4?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController4?.successFetchedItems(viewModel: viewModel)
        }
    }
}
