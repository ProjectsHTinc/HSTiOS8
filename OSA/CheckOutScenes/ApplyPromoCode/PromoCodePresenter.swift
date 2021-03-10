//
//  PromoCodePresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//


import Foundation

protocol PromoCodePresentationLogic
{
  func presentFetchResults(resp: PromoCodeModel.Fetch.Response)
}

class PromoCodePresenter: PromoCodePresentationLogic
{
  weak var viewController1: PromoCodeDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: PromoCodeModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = PromoCodeModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController1?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController1?.successFetchedItems(viewModel: viewModel)
        }
    }
}

