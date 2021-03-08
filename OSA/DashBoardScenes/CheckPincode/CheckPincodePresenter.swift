//
//  CheckPincodePresenter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/03/21.
//


import Foundation

protocol CheckPincodePresentationLogic
{
  func presentFetchResults(resp: CheckPincodeModel.Fetch.Response)
}

class CheckPincodePresenter: CheckPincodePresentationLogic
{
  weak var viewController6: CheckPincodeDisplayLogic?
    
    // MARK: - Presentation logic
    func presentFetchResults(resp: CheckPincodeModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = CheckPincodeModel.Fetch.ViewModel(msg: resp.testObj?.msg, status: resp.testObj?.status, isError: resp.isError, message: resp.message)
        
        if viewModel.isError{
            viewController6?.errorFetchingItems(viewModel: viewModel)
        }else{
            viewController6?.successFetchedItems(viewModel: viewModel)
        }
    }
}

