//
//  ReturnRequestPresenter.swift
//  OSA
//
//  Created by HappysanziMac on 22/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//
import Foundation

protocol ReturnOrderRequestPresentationLogic
{
  func presentFetchResults(resp: ReturnOrderRequestModel.Fetch.Response)
}

class ReturnOrderRequestPresenter: ReturnOrderRequestPresentationLogic
{
  weak var viewController1: ReturnOrderRequestDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: ReturnOrderRequestModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = ReturnOrderRequestModel.Fetch.ViewModel(status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController1?.errorFetchingItems(viewModel: viewModel)
        }else
        {
            viewController1?.successFetchedItems(viewModel: viewModel)
        }
    }
}
